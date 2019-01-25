//
//  WeChatHeader.h
//  WeChat
//
//  Created by TozyZuo on 2018/3/26.
//  Copyright © 2018年 TozyZuo. All rights reserved.
//

#ifndef WeChatHeader_h
#define WeChatHeader_h

#import <UIKit/UIKit.h>

@class WCPayInfoItem;
@interface CMessageWrap : NSObject
@property (retain, nonatomic) WCPayInfoItem *m_oWCPayInfoItem;
@property (assign, nonatomic) unsigned int m_uiMesLocalID;
@property(nonatomic, assign) NSInteger m_uiGameType;  // 1、猜拳; 2、骰子; 0、自定义表情
@property(nonatomic, assign) unsigned long m_uiGameContent;
@property(nonatomic, strong) NSString *m_nsEmoticonMD5;
@property(nonatomic) long long m_n64MesSvrID;
@property (nonatomic, copy) NSString *m_nsContent;                      // 内容
@property (nonatomic, copy) NSString *m_nsToUsr;                        // 接收的用户(微信id)
@property (nonatomic, copy) NSString *m_nsFromUsr;                      // 发送的用户(微信id)
@property (nonatomic, copy) NSString *m_nsLastDisplayContent;
@property (nonatomic, assign) unsigned int m_uiCreateTime;               // 消息生成时间
@property (nonatomic, assign) unsigned int m_uiStatus;                   // 消息状态
@property (nonatomic, assign) int m_uiMessageType;                       // 消息类型
@property (nonatomic, copy) NSString *m_nsRealChatUsr;
@property (nonatomic, copy) NSString *m_nsPushContent;
@property (retain, nonatomic) NSString *m_nsPushBody;
@property (retain, nonatomic) NSString *m_nsDesc;
@property (retain, nonatomic) NSString *m_nsAppExtInfo;
@property (assign, nonatomic) NSUInteger m_uiAppDataSize;
@property (assign, nonatomic) NSUInteger m_uiAppMsgInnerType;
@property (retain, nonatomic) NSString *m_nsShareOpenUrl;
@property (retain, nonatomic) NSString *m_nsShareOriginUrl;
@property (retain, nonatomic) NSString *m_nsJsAppId;
@property (retain, nonatomic) NSString *m_nsPrePublishId;
@property (retain, nonatomic) NSString *m_nsAppID;
@property (retain, nonatomic) NSString *m_nsAppName;
@property (retain, nonatomic) NSString *m_nsThumbUrl;
@property (retain, nonatomic) NSString *m_nsAppMediaUrl;
@property (retain, nonatomic) NSData *m_dtThumbnail;
@property (retain, nonatomic) NSString *m_nsTitle;
@property (retain, nonatomic) NSString *m_nsMsgSource;

+ (BOOL)isSenderFromMsgWrap:(CMessageWrap*) msgWrap;
- (CMessageWrap*)initWithMsgType:(int) type;
- (id)wishingString;

@end

@interface CBaseContact : NSObject
@property (nonatomic, copy) NSString *m_nsEncodeUserName;                // 微信用户名转码
@property (nonatomic, copy) NSString *m_nsNickName;                     // 用户昵称(群)
@property (nonatomic, copy) NSString *m_nsUsrName;                      // 微信id
@property(retain, nonatomic) NSString *m_nsAliasName;                   // 用户名称
@property(retain, nonatomic) NSString *m_nsRemark;                      // 用户备注
@property (nonatomic, assign) int m_uiFriendScene;                       // 是否是自己的好友(非订阅号、自己)
@property (nonatomic,assign) BOOL m_isPlugin;                            // 是否为微信插件
- (BOOL)isSelf;
- (BOOL)isChatroom;
- (id)getContactDisplayName;

@end

@interface CContact : CBaseContact
@property (nonatomic, copy) NSString *m_nsOwner;                        // 拥有者
@property (nonatomic, copy) NSString *m_nsMemberName;
@property(retain, nonatomic) NSString *m_nsHeadImgUrl;

- (id)getChatRoomMemberDisplayName:(id)arg1;

@end

@interface CPushContact : CContact
@property (nonatomic, copy) NSString *m_nsChatRoomUserName;
@property (nonatomic, copy) NSString *m_nsDes;
@property (nonatomic, copy) NSString *m_nsSource;
@property (nonatomic, copy) NSString *m_nsSourceNickName;
@property (nonatomic, copy) NSString *m_nsSourceUserName;
@property (nonatomic, copy) NSString *m_nsTicket;
- (BOOL)isMyContact;
@end

@interface CVerifyContactWrap : NSObject
@property (nonatomic, copy) NSString *m_nsChatRoomUserName;
@property (nonatomic, copy) NSString *m_nsOriginalUsrName;
@property (nonatomic, copy) NSString *m_nsSourceNickName;
@property (nonatomic, copy) NSString *m_nsSourceUserName;
@property (nonatomic, copy) NSString *m_nsTicket;
@property (nonatomic, copy) NSString *m_nsUsrName;
@property (nonatomic, strong) CContact *m_oVerifyContact;
@property (nonatomic, assign) unsigned int m_uiScene;
@property (nonatomic, assign) unsigned int m_uiWCFlag;
@end


@interface GroupMember : NSObject
@property(copy, nonatomic) NSString *m_nsNickName;; // @synthesize m_nsNickName;
@property(nonatomic) unsigned int m_uiMemberStatus; // @synthesize m_uiMemberStatus;
@property(copy, nonatomic) NSString *m_nsMemberName; // @synthesize m_nsMemberName;
@end


#pragma mark - Logic

@interface SayHelloDataLogic : NSObject
@property (nonatomic, strong) NSMutableArray *m_arrHellos;
- (void)loadData:(unsigned int)arg1;
+ (id)getContactFrom:(id)arg1;
- (id)getContactForIndex:(unsigned int)arg1;
- (void)onFriendAssistAddMsg:(NSArray *)arg1;
@end

@interface CContactVerifyLogic : NSObject
- (void)startWithVerifyContactWrap:(id)arg1
                            opCode:(unsigned int)arg2
                        parentView:(id)arg3
                      fromChatRoom:(BOOL)arg4;
@end

@interface ContactsDataLogic : NSObject
@property(nonatomic) unsigned int m_uiScene; // @synthesize m_uiScene;
- (id)getKeysArray;
- (BOOL)reloadContacts;
- (BOOL)hasHistoryGroupContacts;
- (id)getContactsArrayWith:(id)arg1;
- (id)initWithScene:(unsigned int)arg1 delegate:(id)arg2 sort:(BOOL)arg3;
@end

@interface SKBuiltinString_t : NSObject
// Remaining properties
@property(copy, nonatomic) NSString *string; // @dynamic string;
@end

@interface CreateChatRoomResponse : NSObject
@property(strong, nonatomic) SKBuiltinString_t *chatRoomName; // @dynamic chatRoomName;
@end

#pragma mark - Manager

@interface MMNewSessionMgr : NSObject
- (unsigned int)GenSendMsgTime;
@end

@interface CMessageMgr : NSObject

- (void)AddLocalMsg:(NSString*)from MsgWrap:(CMessageWrap*) msgWrap;
- (void)AsyncOnAddMsg:(NSString*)msg MsgWrap:(CMessageMgr*) wrap;
- (id)GetMsg:(id)arg1 n64SvrID:(long long)arg2;
- (void)onRevokeMsg:(id)msg;
- (void)AddMsg:(id)arg1 MsgWrap:(id)arg2;
- (void)AddLocalMsg:(id)arg1 MsgWrap:(id)arg2 fixTime:(_Bool)arg3 NewMsgArriveNotify:(_Bool)arg4;
- (void)AsyncOnSpecialSession:(id)arg1 MsgList:(id)arg2;
- (id)GetHelloUsers:(id)arg1 Limit:(unsigned int)arg2 OnlyUnread:(BOOL)arg3;
- (void)AddEmoticonMsg:(NSString *)msg MsgWrap:(CMessageWrap *)msgWrap;
@end

@interface FriendAsistSessionMgr : NSObject
- (id)GetLastMessage:(id)arg1 HelloUser:(id)arg2 OnlyTo:(BOOL)arg3;
@end

@interface AutoSetRemarkMgr : NSObject
- (id)GetStrangerAttribute:(id)arg1 AttributeName:(int)arg2;
@end

@interface CContactMgr : NSObject

-(CContact*)getContactByName:(NSString*)name;
- (BOOL)setContact:(CContact*)contact nickName:(NSString*)nickName;
- (CContact*)getSelfContact;

//- (id)getSelfContact;
//- (id)getContactByName:(id)arg1;
- (id)getContactList:(unsigned int)arg1 contactType:(unsigned int)arg2;
- (id)getContactForSearchByName:(id)arg1;
- (_Bool)getContactsFromServer:(id)arg1;
- (_Bool)isInContactList:(id)arg1;
- (_Bool)addLocalContact:(id)arg1 listType:(unsigned int)arg2;
@end

@interface MMServiceCenter : NSObject
+ (instancetype)defaultCenter;
- (id)getService:(Class)service;
@end

@interface CGroupMgr : NSObject
- (BOOL)SetChatRoomDesc:(id)arg1 Desc:(id)arg2 Flag:(unsigned int)arg3;
- (BOOL)CreateGroup:(id)arg1 withMemberList:(id)arg2;
- (_Bool)DeleteGroupMember:(id)arg1 withMemberList:(id)arg2 scene:(unsigned long long)arg3;
@end

#pragma mark - ViewController

@interface MMUIViewController : UIViewController
- (void)startLoadingBlocked;
- (void)startLoadingNonBlock;
- (void)startLoadingWithText:(NSString *)text;
- (void)stopLoading;
- (void)stopLoadingWithFailText:(NSString *)text;
- (void)stopLoadingWithOKText:(NSString *)text;
@end

@class MMTableViewInfo, WCTableViewManager;
@interface NewSettingViewController: MMUIViewController
@property (readonly) WCTableViewManager *tableViewManager;
@property(nonatomic, strong) MMTableViewInfo *m_tableViewInfo; //
- (void)reloadTableData;
@end

@interface SayHelloViewController : UIViewController
@property (nonatomic, strong) SayHelloDataLogic *m_DataLogic;
- (void)OnSayHelloDataVerifyContactOK:(CPushContact *)arg1;
@end

#pragma mark - MMTableView
/*
@interface MMTableViewInfo
- (id)getTableView;
- (void)clearAllSection;
- (void)addSection:(id)arg1;
- (void)insertSection:(id)arg1 At:(unsigned int)arg2;
- (id)getSectionAt:(unsigned int)arg1;
@property(nonatomic,assign) id delegate;
@end

@interface WCTableViewSectionManager : NSObject
+ (id)sectionInfoDefaut;
+ (id)sectionInfoHeader:(id)arg1;
+ (id)sectionInfoHeader:(id)arg1 Footer:(id)arg2;
- (void)addCell:(id)arg1;
- (void)removeCellAt:(unsigned long long)arg1;
- (unsigned long long)getCellCount;
@end

@interface WCTableViewCellManager
+ (id)normalCellForSel:(SEL)arg1 target:(id)arg2 title:(id)arg3 accessoryType:(long long)arg4;
+ (id)switchCellForSel:(SEL)arg1 target:(id)arg2 title:(id)arg3 on:(BOOL)arg4;
+ (id)normalCellForSel:(SEL)arg1 target:(id)arg2 title:(id)arg3 rightValue:(id)arg4 accessoryType:(long long)arg5;
+ (id)editorCellForSel:(SEL)arg1 target:(id)arg2 title:(id)arg3 margin:(double)arg4 tip:(id)arg5 focus:(_Bool)arg6 text:(id)arg7;
+ (id)normalCellForTitle:(id)arg1 rightValue:(id)arg2;
+ (id)urlCellForTitle:(id)arg1 url:(id)arg2;
- (void)makeSwitchCell:(id)arg1;
@property(nonatomic) long long editStyle; // @synthesize editStyle=_editStyle;
@property(retain, nonatomic) id userInfo;
@end
*/
@interface MMTableView: UITableView
@end

#pragma mark - UI

@interface MMLoadingView : UIView
- (void)setFitFrame:(long long)arg1;
- (void)startLoading;
- (void)stopLoading;
- (void)stopLoadingAndShowError:(id)arg1;
- (void)stopLoadingAndShowOK:(id)arg1;
@property(retain, nonatomic) UILabel *m_label;
@property (assign, nonatomic) BOOL m_bIgnoringInteractionEventsWhenLoading;
@end

@interface MMTextView : UITextView
@property(retain, nonatomic) NSString *placeholder;
@end

@interface MMUICommonUtil : NSObject
+ (id)getBarButtonWithTitle:(id)arg1 target:(id)arg2 action:(SEL)arg3 style:(int)arg4;
@end

@interface SettingUtil : NSObject
+ (id)getLocalUsrName:(unsigned int)arg1;
@end

@interface ContactSelectView : UIView
@property(nonatomic) _Bool m_bShowHistoryGroup; // @synthesize m_bShowHistoryGroup;
@property(nonatomic) _Bool m_bShowRadarCreateRoom; // @synthesize m_bShowRadarCreateRoom;
@property(nonatomic) _Bool m_bMultiSelect; // @synthesize m_bMultiSelect;
@property(retain, nonatomic) NSDictionary *m_dicExistContact; // @synthesize m_dicExistContact;
@property(retain, nonatomic) NSMutableDictionary *m_dicMultiSelect; // @synthesize m_dicMultiSelect;
@property(nonatomic) unsigned int m_uiGroupScene; // @synthesize m_uiGroupScene;
- (void)initView;
- (void)initSearchBar;
- (void)initData:(unsigned int)arg1;
- (void)makeGroupCell:(id)arg1 head:(id)arg2 title:(id)arg3;
- (void)addSelect:(id)arg1;
- (id)initWithFrame:(struct CGRect)arg1 delegate:(id)arg2;
@end

@interface CAppViewControllerManager : NSObject
+ (id)topViewControllerOfMainWindow;
+ (UINavigationController *)getCurrentNavigationController;
@end

#pragma mark - UICategory

@interface UINavigationController (LogicController)
- (void)PushViewController:(id)arg1 animated:(BOOL)arg2;
@end

@interface GameController : NSObject
+ (NSString*)getMD5ByGameContent:(NSInteger) content;
@end

#pragma mark - Util

@interface WCBizUtil : NSObject

+ (id)dictionaryWithDecodedComponets:(id)arg1 separator:(id)arg2;

@end

@interface SKBuiltinBuffer_t : NSObject

@property(retain, nonatomic) NSData *buffer; // @dynamic buffer;

@end

#pragma mark - Message

@interface WCPayInfoItem: NSObject

@property(retain, nonatomic) NSString *m_c2cNativeUrl;

@end


@interface MMLanguageMgr: NSObject

- (id)getStringForCurLanguage:(id)arg1 defaultTo:(id)arg2;


@end

#pragma mark - RedEnvelop

@interface WCRedEnvelopesControlData : NSObject

@property(retain, nonatomic) CMessageWrap *m_oSelectedMessageWrap;

@end



@interface WCRedEnvelopesLogicMgr: NSObject

- (void)OpenRedEnvelopesRequest:(id)params;
- (void)ReceiverQueryRedEnvelopesRequest:(id)arg1;
- (void)GetHongbaoBusinessRequest:(id)arg1 CMDID:(unsigned int)arg2 OutputType:(unsigned int)arg3;

@end

@interface HongBaoRes : NSObject

@property(retain, nonatomic) SKBuiltinBuffer_t *retText; // @dynamic retText;
@property(nonatomic) int cgiCmdid; // @dynamic cgiCmdid;

@end

@interface HongBaoReq : NSObject

@property(retain, nonatomic) SKBuiltinBuffer_t *reqText; // @dynamic reqText;

@end

#pragma mark - QRCode

@interface ScanQRCodeLogicController: NSObject

@property(nonatomic) unsigned int fromScene;
- (id)initWithViewController:(id)arg1 CodeType:(int)arg2;
- (void)tryScanOnePicture:(id)arg1;
- (void)doScanQRCode:(id)arg1;
- (void)showScanResult;

@end

@interface NewQRCodeScanner: NSObject

- (id)initWithDelegate:(id)arg1 CodeType:(int)arg2;
- (void)notifyResult:(id)arg1 type:(id)arg2 version:(int)arg3;

@end

@interface MMWebViewController: NSObject

- (id)initWithURL:(id)arg1 presentModal:(_Bool)arg2 extraInfo:(id)arg3;

@end


@protocol ContactSelectViewDelegate <NSObject>

- (void)onSelectContact:(CContact *)arg1;

@end

@interface MMUINavigationController : UINavigationController

@end

#pragma mark - UtilCategory

@interface NSMutableDictionary (SafeInsert)

- (void)safeSetObject:(id)arg1 forKey:(id)arg2;

@end

@interface NSDictionary (NSDictionary_SafeJSON)

- (id)arrayForKey:(id)arg1;
- (id)dictionaryForKey:(id)arg1;
- (double)doubleForKey:(id)arg1;
- (float)floatForKey:(id)arg1;
- (long long)int64ForKey:(id)arg1;
- (long long)integerForKey:(id)arg1;
- (id)stringForKey:(id)arg1;

@end

@interface NSString (NSString_SBJSON)

- (id)JSONArray;
- (id)JSONDictionary;
- (id)JSONValue;

@end

@interface ContactInfoViewController : MMUIViewController

@property(retain, nonatomic) CContact *m_contact; // @synthesize m_contact;

@end

@protocol MultiSelectContactsViewControllerDelegate <NSObject>
- (void)onMultiSelectContactReturn:(NSArray *)arg1;

@optional
- (int)getFTSCommonScene;
- (void)onMultiSelectContactCancelForSns;
- (void)onMultiSelectContactReturnForSns:(NSArray *)arg1;
@end

@interface MultiSelectContactsViewController : UIViewController

@property(nonatomic) _Bool m_bKeepCurViewAfterSelect;
@property(nonatomic) unsigned int m_uiGroupScene;
@property(nonatomic, weak) id <MultiSelectContactsViewControllerDelegate> m_delegate;

@end

@interface BaseChatViewModel : NSObject
@property(nonatomic) double createTime;
@property(retain, nonatomic) CBaseContact *chatContact;
@end

@interface BaseMessageViewModel : BaseChatViewModel
@property(retain, nonatomic) CBaseContact *contact;
@property(retain, nonatomic) CMessageWrap *messageWrap;
+ (id)createMessageViewModelWithMessageWrap:(id)arg1 contact:(id)arg2 chatContact:(id)arg3;
- (id)chatRoomDisplayName;
@end

@interface CommonMessageViewModel : BaseMessageViewModel
{
@public
    _Bool m_isShowChatRoomDisplayName;
}

- (id)accessibilityDescription;
- (void)OnMsgDownloadAppAttachSuccess:(id)arg1 MsgWrap:(id)arg2;
- (struct CGSize)measure:(struct CGSize)arg1;
- (id)maskBubbleInfo;
- (id)bgBubbleInfo;
- (_Bool)isShowSendFailView;
- (_Bool)isShowSendingView;
- (_Bool)isShowAppMessageBlockButton;
- (_Bool)souceIconBgIsShow;
- (id)sourceTag;
- (id)sourceIcon;
- (id)sourceTitle;
- (_Bool)shouldShowSourceViewInContent;
- (_Bool)isShowSourceView;
- (_Bool)calIsShowChatRoomDisplayName;
- (_Bool)isShowChatRoomDisplayName;
- (_Bool)isShowHeadImage;
- (void)updateChatContact:(id)arg1;
- (void)dealloc;
- (id)initWithMessageWrap:(id)arg1 contact:(id)arg2 chatContact:(id)arg3;

@end

@interface MMCPLabel : UILabel
@end

@interface CommonMessageCellView : UIView
{
    MMCPLabel *m_chatRoomNameLabel;
}
@property(readonly, nonatomic) CommonMessageViewModel *viewModel;
@end

@interface ChatTableViewCell : UITableViewCell
@property (readonly, nonatomic) CommonMessageCellView *cellView;
@end


@protocol BaseMsgContentDelgate <NSObject>
- (BOOL)IsRecording;
@end

@interface BaseMsgContentViewController : UIViewController

@property(nonatomic) __weak id <BaseMsgContentDelgate> m_delegate;
- (id)getCurrentChatName;
- (void)reloadViewInteral;
@end

@interface MMMsgLogicManager

-(void)PushOtherBaseMsgControllerByContact:(CContact*)contact navigationController:(UINavigationController*)navi animated:(BOOL)animated;
@end

@interface UIView (Add)
@property(nonatomic) double right;
@property(nonatomic) double bottom;
@property(nonatomic) double left;
@property(nonatomic) double top;
@property(nonatomic) double width;
@property(nonatomic) double height;
@property(readonly, nonatomic) struct CGPoint topRight;
@property(readonly, nonatomic) struct CGPoint bottomLeft;
@property(readonly, nonatomic) struct CGPoint bottomRight;
@property(nonatomic) struct CGSize size;
@property(nonatomic) struct CGPoint origin;
@end


@interface TextMessageSubViewModel : BaseChatViewModel // TextMessageViewModel
@property(nonatomic) BaseChatViewModel /* TextMessageViewModel */ *parentModel;
@end

@interface SessionVoiceTranslateInfos : NSObject
@property(retain, nonatomic) NSMutableDictionary *dicVoiceTransInfo;
@property(retain, nonatomic) NSString *userName;
@end

@interface VoiceTranslateUtil : NSObject
+ (id)getVoiceIDFromMsg:(id)arg1;
- (id)getTranslateString:(id)arg1;
- (_Bool)isLocalTransResultExist:(id)arg1;
@end

@interface VoiceTranslateMsgMgr : NSObject
//- (id)getTranslateInfo:(id)arg1;
- (SessionVoiceTranslateInfos *)loadSessionTransInfos:(id)arg1;
- (void)translateVoiceMessage:(id)arg1;
@end

@interface VoiceTranslateInfo : NSObject
@property(retain, nonatomic) CMessageWrap *messageWrap; // @synthesize messageWrap=_messageWrap;
@property(nonatomic) long long status; // @synthesize status=_status;
@property(nonatomic) _Bool bAutoScrollUp; // @synthesize bAutoScrollUp=_bAutoScrollUp;
@property(nonatomic) _Bool bShowAnimation; // @synthesize bShowAnimation=_bShowAnimation;
@property(nonatomic) unsigned long long fristTranslateTime; // @synthesize fristTranslateTime=_fristTranslateTime;
@property(nonatomic) unsigned long long translateStartTime; // @synthesize translateStartTime=_translateStartTime;
@property(retain, nonatomic) NSString *displayText; // @synthesize displayText=_displayText;
@property(retain, nonatomic) NSString *translatedText; // @synthesize translatedText=_translatedText;
@property(retain, nonatomic) NSString *voiceId; // @synthesize voiceId=_voiceId;
@property(nonatomic) unsigned long long translatedTime; // @synthesize translatedTime;
@property(nonatomic) unsigned int mesLocalId;
@end

@interface VoiceMessageViewModel : CommonMessageViewModel
@property(retain, nonatomic) VoiceTranslateInfo *voiceTranslateInfo;
- (_Bool)canShowTranslateText;
- (struct CGSize)measureContentViewSize:(struct CGSize)arg1;
@end

@interface AudioSender : NSObject
- (_Bool)isRecording;
@end


@interface WCTableViewManager
- (id)getTableView;
- (void)clearAllSection;
- (void)addSection:(id)arg1;
- (void)insertSection:(id)arg1 At:(unsigned int)arg2;
- (id)getSectionAt:(unsigned int)arg1;
@property(nonatomic,assign) id delegate;
@end

@interface MMTableViewInfo : WCTableViewManager

@end

@interface WCTableViewSectionManager
+ (id)defaultSection;
+ (id)sectionInfoHeader:(id)arg1;
+ (id)sectionInfoHeader:(id)arg1 Footer:(id)arg2;
- (void)addCell:(id)arg1;
- (void)removeCellAt:(unsigned long long)arg1;
//- (unsigned long long)getCellCount;
@end

@interface WCTableViewCellBaseConfig : NSObject
@property(nonatomic) __weak id clickTarget; // @synthesize clickTarget=_clickTarget;
@property(nonatomic) SEL clickAction; // @synthesize clickAction=_clickAction;
@property(nonatomic) long long editStyle; // @synthesize editStyle=_editStyle;
@property(nonatomic) unsigned long long selectionStyle; // @synthesize selectionStyle=_selectionStyle;
- (void)addTarget:(id)arg1 clickAction:(SEL)arg2;
@end

@interface WCTableViewCellManager
//+ (id)normalCellForSel:(SEL)arg1 target:(id)arg2 title:(id)arg3 accessoryType:(long long)arg4;
+ (id)switchCellForSel:(SEL)arg1 target:(id)arg2 title:(id)arg3 on:(BOOL)arg4;
//+ (id)editorCellForSel:(SEL)arg1 target:(id)arg2 title:(id)arg3 margin:(double)arg4 tip:(id)arg5 focus:(_Bool)arg6 text:(id)arg7;
//+ (id)urlCellForTitle:(id)arg1 url:(id)arg2;
//- (void)makeSwitchCell:(id)arg1;
//@property(nonatomic) long long editStyle; // @synthesize editStyle=_editStyle;
@property(retain, nonatomic) id userInfo;
@property(retain, nonatomic) WCTableViewCellBaseConfig *cellConfig; // @synthesize cellConfig=_cellConfig;
@end


@interface WCTableViewNormalCellManager : WCTableViewCellManager
+ (WCTableViewNormalCellManager *)normalCellForSel:(SEL)arg1 target:(id)arg2 title:(id)arg3 accessoryType:(long long)arg4;
+ (id)normalCellForTitle:(id)arg1 rightValue:(id)arg2;
+ (id)normalCellForSel:(SEL)arg1 target:(id)arg2 title:(id)arg3 rightValue:(id)arg4 accessoryType:(long long)arg5;
@end
#endif /* WeChatHeader_h */
