//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  LKMessageSwitchPod.m
//  LKMessageSwitchPod
//
//  Created by sherlock on 2017/10/12.
//  Copyright (c) 2017年 sherlock. All rights reserved.
//

#import "LKMessageSwitchPod.h"
#import <UIKit/UIKit.h>
#import <CaptainHook/CaptainHook.h>
#import "WeChatHeader.h"
//#import "LKWeChatHeader.h"
#import "UINavigationController+FDFullscreenPopGesture.h"

#define NSLog(...)

@interface LKNewestMsgManager:NSData
@property(nonatomic, strong) NSString *username;
@property(nonatomic, strong) NSString *content;
@property(nonatomic, strong) NSString *nickname;
@property(nonatomic, strong) NSString *currentChat;
@property(nonatomic, strong) NSString *didTouchBtnName;
@property(nonatomic, strong) NSString *FromUsr;
+(instancetype)sharedInstance;
@end

@implementation LKNewestMsgManager

+(instancetype)sharedInstance{
    static LKNewestMsgManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [LKNewestMsgManager new];
    });
    return instance;
}

- (void)LKDidReceiveNewMessage{
    
}

//获取当前显示的VC
- (UIViewController *)getCurrentVC{
    id vc = [objc_getClass("CAppViewControllerManager") topViewControllerOfMainWindow];
    return vc;

    //获取默认window
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if(window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication]windows];
        for(UIWindow *tmpWindow in windows){
            if (tmpWindow.windowLevel == UIWindowLevelNormal) {
                window = tmpWindow;
                break;
            }
        }
    }
    
    //获取window的根视图
    UIViewController *currentVC = window.rootViewController;
    while (currentVC.presentedViewController) {
        currentVC = currentVC.presentedViewController;
    }
    if ([currentVC isKindOfClass:[UITabBarController class]]) {
        currentVC = [(UITabBarController*)currentVC selectedViewController];
    }
    if ([currentVC isKindOfClass:[UINavigationController class]]) {
        currentVC = [(UINavigationController*)currentVC visibleViewController];
    }
    return currentVC;
}
@end

@interface LKNotificationView : UIVisualEffectView
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UILabel *textLabel;
@end
@implementation LKNotificationView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]])
    {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:17];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        [self addSubview:label];
        self.textLabel = label;

        self.frame = frame;
        self.layer.cornerRadius = 10;
        self.clipsToBounds = YES;

        __weak typeof(self) weakSelf = self;
        __block id observer = [[NSNotificationCenter defaultCenter] addObserverForName:@"btnDidTouch" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
            if ([weakSelf.userName isEqual: [LKNewestMsgManager sharedInstance].didTouchBtnName]) {
                [weakSelf removeFromSuperview];
                [[NSNotificationCenter defaultCenter] removeObserver:observer];
            }
        }];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];

    self.textLabel.frame = CGRectMake(10, 0, frame.size.width - 20, frame.size.height);
}

- (void)setText:(NSString *)text
{
    if (![_text isEqualToString:text]) {
        _text = text;

        self.textLabel.text = text;
    }
}

@end

void ShowAnimation(UIView *view)
{
    CGRect frame = view.frame;
    view.bottom = view.top;
    [UIView animateWithDuration:.2 animations:^{
        view.frame = frame;
    }];
}

void DismissAnimation(UIView *view, UISwipeGestureRecognizerDirection direction)
{
    [UIView animateWithDuration:.2 animations:^{
        switch (direction) {
            case UISwipeGestureRecognizerDirectionUp:
                view.bottom = view.top;
                break;
            case UISwipeGestureRecognizerDirectionLeft:
                view.right = view.left;
                break;
            case UISwipeGestureRecognizerDirectionRight:
                view.left = view.right;
                break;
            default:
                break;
        }
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
    }];
}

//聊天基本页面
CHDeclareClass(BaseMsgContentViewController)
CHOptimizedMethod1(self, void, BaseMsgContentViewController, viewDidAppear, BOOL, flag){
    //    NSLog(@"hehehehe");
    [LKNewestMsgManager sharedInstance].currentChat = [(BaseMsgContentViewController*)[[LKNewestMsgManager sharedInstance] getCurrentVC]getCurrentChatName];
    
    NSLog(@"%@", [LKNewestMsgManager sharedInstance].currentChat);
    
    CHSuper1(BaseMsgContentViewController, viewDidAppear, flag);
}

CHOptimizedMethod1(self, void, BaseMsgContentViewController, viewWillDisappear, BOOL, disappear){
    [LKNewestMsgManager sharedInstance].currentChat = NULL;
    
    CHSuper1(BaseMsgContentViewController, viewWillDisappear, disappear);
}

CHConstructor{
    CHLoadLateClass(BaseMsgContentViewController);
    CHClassHook1(BaseMsgContentViewController, viewWillDisappear);
    CHClassHook1(BaseMsgContentViewController, viewDidAppear);
}

// hook MMUIViewController基类

CHDeclareClass(MMUIViewController)

CHDeclareMethod1(void, MMUIViewController, backToMsgContentViewController, UITapGestureRecognizer *, sender){
    [sender.view removeFromSuperview];
    UINavigationController *navi = [objc_getClass("CAppViewControllerManager") getCurrentNavigationController];

    NSString *userName = ((LKNotificationView *)sender.view).userName;
    [LKNewestMsgManager sharedInstance].didTouchBtnName = userName;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"btnDidTouch" object:nil];
    MMServiceCenter* serviceCenter = [objc_getClass("MMServiceCenter") defaultCenter];
    CContactMgr *contactMgr = [serviceCenter getService:[objc_getClass("CContactMgr") class]];
    CContact *contact = [contactMgr getContactByName:userName];
    
    MMMsgLogicManager *logicManager = [serviceCenter getService:[objc_getClass("MMMsgLogicManager") class]];
    [logicManager PushOtherBaseMsgControllerByContact:contact navigationController:navi animated:YES];
}

CHDeclareMethod1(void, MMUIViewController, handleSwipes, UISwipeGestureRecognizer*, sender){
    NSLog(@"右滑了");
    DismissAnimation(sender.view, sender.direction);
}

CHDeclareMethod0(void, MMUIViewController, messageCallBack){
    NSLog(@"收到消息!!!");
    
    NSString *currentChatName = [LKNewestMsgManager sharedInstance].currentChat;
    if (self == [[LKNewestMsgManager sharedInstance]getCurrentVC] && ![currentChatName isEqual: [LKNewestMsgManager sharedInstance].username])
    {
        LKNotificationView *view = [[LKNotificationView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, 44)];
        view.text = [LKNewestMsgManager sharedInstance].content;
        view.userName = [LKNewestMsgManager sharedInstance].username;

        UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
        swipe.direction = UISwipeGestureRecognizerDirectionUp;
        swipe.numberOfTouchesRequired = 1;
        [view addGestureRecognizer:swipe];

        swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
        swipe.direction = UISwipeGestureRecognizerDirectionLeft;
        swipe.numberOfTouchesRequired = 1;
        [view addGestureRecognizer:swipe];

        swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
        swipe.direction = UISwipeGestureRecognizerDirectionRight;
        swipe.numberOfTouchesRequired = 1;
        [view addGestureRecognizer:swipe];

        [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backToMsgContentViewController:)]];
        [self.navigationController.fd_fullscreenPopGestureRecognizer requireGestureRecognizerToFail:swipe];
        [self.view addSubview:view];

        ShowAnimation(view);
        if ([UIApplication sharedApplication].applicationState == UIApplicationStateActive) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                DismissAnimation(view, UISwipeGestureRecognizerDirectionUp);
            });
        }
    }
}

CHOptimizedMethod1(self, void, MMUIViewController, viewWillAppear, BOOL, flag){
    
    NSLog(@"出现了!!!");
    // TO作者：appear的时候可能不是top？
//    NSString *currentVCClassName = [NSString stringWithUTF8String:object_getClassName([[LKNewestMsgManager sharedInstance]getCurrentVC])];
    NSString *currentVCClassName = @(object_getClassName(self));
    
    //&& ![currentVCClassName isEqual:@"NSKVONotifying_BaseMsgContentViewController"]
    //![currentVCClassName  isEqual: @"NSKVONotifying_NewMainFrameViewController"] &&
    if (![currentVCClassName  isEqual: @"NSKVONotifying_NewMainFrameViewController"]
        &&![currentVCClassName isEqual:@"NSKVONotifying_WCCommentListViewController"]
        && ![currentVCClassName isEqual:@"NSKVONotifying_SayHelloViewController"]) { //对新好友提示页面和朋友圈评论列表页面设置通知,会导致页面不被释放,消息重复提示的bug
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(messageCallBack) name:@"LkWechatMessageNotification" object:nil];
        
    }
    CHSuper1(MMUIViewController, viewWillAppear, flag);
}

CHOptimizedMethod1(self, void, MMUIViewController, viewWillDisappear, BOOL, flag){
    
    NSLog(@"消失了!!!移除监听");
    // TO作者：disappear的时候可能不是top？
//    NSString *currentVCClassName = [NSString stringWithUTF8String:object_getClassName([[LKNewestMsgManager sharedInstance]getCurrentVC])];
    NSString * currentVCClassName = @(object_getClassName(self));

    
    //&& ![currentVCClassName isEqual:@"NSKVONotifying_BaseMsgContentViewController"]
    //![currentVCClassName  isEqual: @"NSKVONotifying_NewMainFrameViewController"] &&
    if (![currentVCClassName  isEqual: @"NSKVONotifying_NewMainFrameViewController"]
        &&![currentVCClassName isEqual:@"NSKVONotifying_WCCommentListViewController"]
        && ![currentVCClassName isEqual:@"NSKVONotifying_SayHelloViewController"]) {
        [[NSNotificationCenter defaultCenter]removeObserver:self name:@"LkWechatMessageNotification" object:nil];
    }
    CHSuper1(MMUIViewController, viewWillDisappear, flag);
}

CHConstructor{
    CHLoadLateClass(MMUIViewController);
    CHClassHook1(MMUIViewController, viewWillAppear);
    CHClassHook1(MMUIViewController, viewWillDisappear);
}

// hook 消息接收类
CHDeclareClass(CMessageMgr)
CHOptimizedMethod2(self, void, CMessageMgr, AsyncOnAddMsg, NSString *, msg, MsgWrap, CMessageWrap*, wrap){

    if(![wrap.m_nsPushContent isEqual: @""] && wrap.m_nsPushContent != NULL){

        CContactMgr *contactMgr = [[objc_getClass("MMServiceCenter") defaultCenter] getService:[objc_getClass("CContactMgr") class]];

        CContact *fromUsrContact = [contactMgr getContactByName:wrap.m_nsFromUsr];
        NSMutableString *text = [NSMutableString stringWithString:@""];

        if (fromUsrContact.isChatroom) {
            CContact *realChatUsrContact = [contactMgr getContactByName:wrap.m_nsRealChatUsr];
            [text appendFormat:@"[%@] ", [fromUsrContact getContactDisplayName]];
            [text appendFormat:@"%@:%@", [fromUsrContact getChatRoomMemberDisplayName:realChatUsrContact], wrap.m_nsContent];
        } else {
            [text appendFormat:@"%@:%@", [fromUsrContact getContactDisplayName], wrap.m_nsContent];
        }

        [LKNewestMsgManager sharedInstance].username = msg;
        NSLog(@"%@", [LKNewestMsgManager sharedInstance].username);
        [LKNewestMsgManager sharedInstance].content = text;
        NSLog(@"%@", [LKNewestMsgManager sharedInstance].content);
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"LkWechatMessageNotification" object:nil];
    }

    CHSuper2(CMessageMgr, AsyncOnAddMsg, msg, MsgWrap, wrap);
}


CHConstructor{
    CHLoadLateClass(CMessageMgr);
    CHClassHook2(CMessageMgr, AsyncOnAddMsg, MsgWrap);
}
