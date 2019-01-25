//
//  TZWCPSettingViewController.m
//  WeChatDylib
//
//  Created by TozyZuo on 2018/3/29.
//  Copyright © 2018年 TozyZuo. All rights reserved.
//

#import "TZWCPSettingViewController.h"
#import "TZWeChatPluginConfig.h"
#import "WeChatHeader.h"
#import <objc/runtime.h>

@interface TZWCPSettingViewController ()
@property (nonatomic, strong) WCTableViewManager *tableViewInfo;
@end

@implementation TZWCPSettingViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // 增加对iPhone X的屏幕适配
        CGRect winSize = [UIScreen mainScreen].bounds;
        if (winSize.size.height == 812) { // iPhone X 高为812
            winSize.size.height -= 88;
            winSize.origin.y = 88;
        }
        _tableViewInfo = [[objc_getClass("WCTableViewManager") alloc] initWithFrame:winSize style:UITableViewStyleGrouped];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"WeChatPlugin";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0]}];

    [self reloadTableData];
    [self.view addSubview:[self.tableViewInfo getTableView]];
}

- (void)reloadTableData
{
    [self.tableViewInfo clearAllSection];
    [self addTimeDisplaySection];
//    [self addGestureSection];
    [self addAutoTranslateVoiceSection];

    MMTableView *tableView = [self.tableViewInfo getTableView];
    [tableView reloadData];
}

- (void)addTimeDisplaySection
{
    TZWeChatPluginConfig *config = [TZWeChatPluginConfig sharedConfig];

    WCTableViewSectionManager *sectionInfo = [objc_getClass("WCTableViewSectionManager") sectionInfoHeader:@"时间设置" Footer:nil];
    BOOL timeDisplayEnable = config.timeDisplayEnable;
    [sectionInfo addCell:[objc_getClass("WCTableViewCellManager") switchCellForSel:@selector(timeDisplayEnableAction:) target:self title:@"开启消息时间显示" on:timeDisplayEnable]];

    if (timeDisplayEnable) {
        [sectionInfo addCell:[objc_getClass("WCTableViewCellManager") switchCellForSel:[config selectorForPropertySEL:@selector(displayWholeTimeEnable)] target:config title:@"显示完整时间(年-月-日 时:分:秒)" on:config.displayWholeTimeEnable]];
        [sectionInfo addCell:[objc_getClass("WCTableViewCellManager") switchCellForSel:[config selectorForPropertySEL:@selector(hideWeChatTimeEnable)] target:config title:@"隐藏微信原生时间" on:config.hideWeChatTimeEnable]];
    }

    [self.tableViewInfo addSection:sectionInfo];
}

- (void)addGestureSection
{
    TZWeChatPluginConfig *config = [TZWeChatPluginConfig sharedConfig];

    WCTableViewSectionManager *sectionInfo = [objc_getClass("WCTableViewSectionManager") sectionInfoHeader:@"手势" Footer:nil];
    [sectionInfo addCell:[objc_getClass("WCTableViewCellManager") switchCellForSel:[config selectorForPropertySEL:@selector(fullscreenPopGestureEnable)] target:config title:@"开启全屏滑动返回手势" on:config.fullscreenPopGestureEnable]];

    [self.tableViewInfo addSection:sectionInfo];
}

- (void)addAutoTranslateVoiceSection
{
    TZWeChatPluginConfig *config = [TZWeChatPluginConfig sharedConfig];

    WCTableViewSectionManager *sectionInfo = [objc_getClass("WCTableViewSectionManager") sectionInfoHeader:@"自动化" Footer:nil];
    [sectionInfo addCell:[objc_getClass("WCTableViewCellManager") switchCellForSel:@selector(autoTranslateVoiceEnableAction:) target:self title:@"开启语音自动转文字" on:config.autoTranslateVoiceEnable]];
    if (config.autoTranslateVoiceEnable) {
        [sectionInfo addCell:[objc_getClass("WCTableViewCellManager") switchCellForSel:[config selectorForPropertySEL:@selector(translateMyselfVoiceEnable)] target:config title:@"转换我发出的语音" on:config.translateMyselfVoiceEnable]];
    }

    [self.tableViewInfo addSection:sectionInfo];
}

- (void)timeDisplayEnableAction:(UISwitch *)s
{
    [TZWeChatPluginConfig sharedConfig].timeDisplayEnable = s.on;
    [self reloadTableData];
}

- (void)autoTranslateVoiceEnableAction:(UISwitch *)s
{
    [TZWeChatPluginConfig sharedConfig].autoTranslateVoiceEnable = s.on;
    [self reloadTableData];
}

@end
