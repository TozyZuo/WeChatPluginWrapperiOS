#line 1 "/Users/Tozy/Documents/GitHub/WeChatPluginWrapperiOS/SharedFiles/TKkk/TKkkTweak.xm"
#import "WeChatRobot.h"
#import "TKRobotConfig.h"
#import "TKSettingViewController.h"
#import "EmoticonGameCheat.h"


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class WCDeviceStepObject; @class CContactVerifyLogic; @class FriendAsistSessionMgr; @class CVerifyContactWrap; @class SayHelloDataLogic; @class MMServiceCenter; @class CMessageWrap; @class SettingUtil; @class AutoSetRemarkMgr; @class MMNewSessionMgr; @class CMessageMgr; 
static void (*_logos_orig$_ungrouped$CMessageMgr$AddEmoticonMsg$MsgWrap$)(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, NSString *, CMessageWrap *); static void _logos_method$_ungrouped$CMessageMgr$AddEmoticonMsg$MsgWrap$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, NSString *, CMessageWrap *); static void (*_logos_orig$_ungrouped$CMessageMgr$MessageReturn$MessageInfo$Event$)(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, unsigned int, NSDictionary *, unsigned int); static void _logos_method$_ungrouped$CMessageMgr$MessageReturn$MessageInfo$Event$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, unsigned int, NSDictionary *, unsigned int); static id (*_logos_orig$_ungrouped$CMessageMgr$GetHelloUsers$Limit$OnlyUnread$)(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, id, unsigned int, _Bool); static id _logos_method$_ungrouped$CMessageMgr$GetHelloUsers$Limit$OnlyUnread$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, id, unsigned int, _Bool); static void (*_logos_orig$_ungrouped$CMessageMgr$onRevokeMsg$)(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, CMessageWrap *); static void _logos_method$_ungrouped$CMessageMgr$onRevokeMsg$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, CMessageWrap *); static void _logos_method$_ungrouped$CMessageMgr$autoReplyWithMessageWrap$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, CMessageWrap *); static void _logos_method$_ungrouped$CMessageMgr$removeMemberWithMessageWrap$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, CMessageWrap *); static void _logos_method$_ungrouped$CMessageMgr$autoReplyChatRoomWithMessageWrap$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, CMessageWrap *); static void _logos_method$_ungrouped$CMessageMgr$welcomeJoinChatRoomWithMessageWrap$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, CMessageWrap *); static void _logos_method$_ungrouped$CMessageMgr$addAutoVerifyWithMessageInfo$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, NSDictionary *); static void _logos_method$_ungrouped$CMessageMgr$addAutoVerifyWithArray$arrayType$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, NSArray *, TKArrayTpye); static void _logos_method$_ungrouped$CMessageMgr$sendMsg$toContactUsrName$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, NSString *, NSString *); static NSInteger (*_logos_orig$_ungrouped$WCDeviceStepObject$m7StepCount)(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST, SEL); static NSInteger _logos_method$_ungrouped$WCDeviceStepObject$m7StepCount(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST, SEL); static NSInteger (*_logos_orig$_ungrouped$WCDeviceStepObject$hkStepCount)(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST, SEL); static NSInteger _logos_method$_ungrouped$WCDeviceStepObject$hkStepCount(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SayHelloDataLogic(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SayHelloDataLogic"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$MMServiceCenter(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("MMServiceCenter"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$CContactVerifyLogic(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("CContactVerifyLogic"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$CVerifyContactWrap(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("CVerifyContactWrap"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$FriendAsistSessionMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("FriendAsistSessionMgr"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$CMessageMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("CMessageMgr"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SettingUtil(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SettingUtil"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$CMessageWrap(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("CMessageWrap"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$AutoSetRemarkMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("AutoSetRemarkMgr"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$MMNewSessionMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("MMNewSessionMgr"); } return _klass; }
#line 6 "/Users/Tozy/Documents/GitHub/WeChatPluginWrapperiOS/SharedFiles/TKkk/TKkkTweak.xm"


static void _logos_method$_ungrouped$CMessageMgr$AddEmoticonMsg$MsgWrap$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * msg, CMessageWrap * msgWrap) {
    if ([[TKRobotConfig sharedConfig] preventGameCheatEnable]) { 
        if ([msgWrap m_uiMessageType] == 47 && ([msgWrap m_uiGameType] == 2|| [msgWrap m_uiGameType] == 1)) {
            [EmoticonGameCheat showEoticonCheat:[msgWrap m_uiGameType] callback:^(NSInteger random){
                [msgWrap setM_nsEmoticonMD5:[objc_getClass("GameController") getMD5ByGameContent:random]];
                [msgWrap setM_uiGameContent:random];
                _logos_orig$_ungrouped$CMessageMgr$AddEmoticonMsg$MsgWrap$(self, _cmd, msg, msgWrap);
            }];
            return;
        }
    }

    _logos_orig$_ungrouped$CMessageMgr$AddEmoticonMsg$MsgWrap$(self, _cmd, msg, msgWrap);
}

static void _logos_method$_ungrouped$CMessageMgr$MessageReturn$MessageInfo$Event$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, unsigned int arg1, NSDictionary * info, unsigned int arg3) {
    _logos_orig$_ungrouped$CMessageMgr$MessageReturn$MessageInfo$Event$(self, _cmd, arg1, info, arg3);
    CMessageWrap *wrap = [info objectForKey:@"18"];
    NSLog(@"%s %d", __func__, __LINE__);
    if (arg1 == 227) {
        NSDate *now = [NSDate date];
        NSTimeInterval nowSecond = now.timeIntervalSince1970;
        if (nowSecond - wrap.m_uiCreateTime > 60) {      
            return;
        }
        CContactMgr *contactMgr = [[objc_getClass("MMServiceCenter") defaultCenter] getService:objc_getClass("CContactMgr")];
        CContact *contact = [contactMgr getContactByName:wrap.m_nsFromUsr];
        if(wrap.m_uiMessageType == 1) {                                         
            if (contact.m_uiFriendScene == 0 && ![contact isChatroom]) {
                
                return;
            }
            if (![contact isChatroom]) {                                        
                [self autoReplyWithMessageWrap:wrap];                           
            } else {
                [self removeMemberWithMessageWrap:wrap];                        
                [self autoReplyChatRoomWithMessageWrap:wrap];                   
            }
        } else if(wrap.m_uiMessageType == 10000) {                              
            CContact *selfContact = [contactMgr getSelfContact];
            if([selfContact.m_nsUsrName isEqualToString:contact.m_nsOwner]) {   
                [self welcomeJoinChatRoomWithMessageWrap:wrap];
            }
        }
    } else if (arg1 == 332) {                                                          
        [self addAutoVerifyWithMessageInfo:info];
    }
}

static id _logos_method$_ungrouped$CMessageMgr$GetHelloUsers$Limit$OnlyUnread$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, unsigned int arg2, _Bool arg3) {
    id userNameArray = _logos_orig$_ungrouped$CMessageMgr$GetHelloUsers$Limit$OnlyUnread$(self, _cmd, arg1, arg2, arg3);
    if ([arg1 isEqualToString:@"fmessage"] && arg2 == 0 && arg3 == 0) {
        [self addAutoVerifyWithArray:userNameArray arrayType:TKArrayTpyeMsgUserName];
    }

    return userNameArray;
}

static void _logos_method$_ungrouped$CMessageMgr$onRevokeMsg$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CMessageWrap * arg1) {
    NSLog(@"%s %d", __func__, __LINE__);
    if ([[TKRobotConfig sharedConfig] preventRevokeEnable]) {
        NSString *msgContent = arg1.m_nsContent;

    	NSString *(^parseParam)(NSString *, NSString *,NSString *) = ^NSString *(NSString *content, NSString *paramBegin,NSString *paramEnd) {
    		NSUInteger startIndex = [content rangeOfString:paramBegin].location + paramBegin.length;
    		NSUInteger endIndex = [content rangeOfString:paramEnd].location;
    		NSRange range = NSMakeRange(startIndex, endIndex - startIndex);
    		return [content substringWithRange:range];
    	};

        NSString *session = parseParam(msgContent, @"<session>", @"</session>");
        NSString *newmsgid = parseParam(msgContent, @"<newmsgid>", @"</newmsgid>");
        NSString *fromUsrName = parseParam(msgContent, @"<![CDATA[", @"撤回了一条消息");
        CMessageWrap *revokemsg = [self GetMsg:session n64SvrID:[newmsgid integerValue]];

        CContactMgr *contactMgr = [[objc_getClass("MMServiceCenter") defaultCenter] getService:objc_getClass("CContactMgr")];
        CContact *selfContact = [contactMgr getSelfContact];
        NSString *newMsgContent = @"";


        if ([revokemsg.m_nsFromUsr isEqualToString:selfContact.m_nsUsrName]) {
               if (revokemsg.m_uiMessageType == 1) {       
                   newMsgContent = [NSString stringWithFormat:@"拦截到你撤回了一条消息：\n %@",revokemsg.m_nsContent];
               } else {
                   newMsgContent = @"拦截到你撤回一条消息";
               }
        } else {
                if (revokemsg.m_uiMessageType == 1) {
                       newMsgContent = [NSString stringWithFormat:@"拦截到一条 %@撤回消息：\n %@",fromUsrName, revokemsg.m_nsContent];
                   } else {
                        newMsgContent = [NSString stringWithFormat:@"拦截到一条 %@撤回消息",fromUsrName];
               }
        }

        CMessageWrap *newWrap = ({
                CMessageWrap *msg = [[_logos_static_class_lookup$CMessageWrap() alloc] initWithMsgType:0x2710];
                [msg setM_nsFromUsr:revokemsg.m_nsFromUsr];
                [msg setM_nsToUsr:revokemsg.m_nsToUsr];
                [msg setM_uiStatus:0x4];
                [msg setM_nsContent:newMsgContent];
                [msg setM_uiCreateTime:[arg1 m_uiCreateTime]];

                msg;
            });

    	[self AddLocalMsg:session MsgWrap:newWrap fixTime:0x1 NewMsgArriveNotify:0x0];
        return;
    }
    _logos_orig$_ungrouped$CMessageMgr$onRevokeMsg$(self, _cmd, arg1);
}


static void _logos_method$_ungrouped$CMessageMgr$autoReplyWithMessageWrap$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CMessageWrap * wrap) {
    BOOL autoReplyEnable = [[TKRobotConfig sharedConfig] autoReplyEnable];
    NSString *autoReplyContent = [[TKRobotConfig sharedConfig] autoReplyText];
    if (!autoReplyEnable || autoReplyContent == nil || [autoReplyContent isEqualToString:@""]) {                                                     
        return;
    }
    NSLog(@"%s %d", __func__, __LINE__);
    NSString * content = MSHookIvar<id>(wrap, "m_nsLastDisplayContent");
    NSString *needAutoReplyMsg = [[TKRobotConfig sharedConfig] autoReplyKeyword];
    NSArray * keyWordArray = [needAutoReplyMsg componentsSeparatedByString:@"||"];
    [keyWordArray enumerateObjectsUsingBlock:^(NSString *keyword, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([keyword isEqualToString:@"*"] || [content isEqualToString:keyword]) {
            [self sendMsg:autoReplyContent toContactUsrName:wrap.m_nsFromUsr];
        }
    }];
}


static void _logos_method$_ungrouped$CMessageMgr$removeMemberWithMessageWrap$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CMessageWrap * wrap) {
    BOOL chatRoomSensitiveEnable = [[TKRobotConfig sharedConfig] chatRoomSensitiveEnable];
    if (!chatRoomSensitiveEnable) {
        return;
    }

    CGroupMgr *groupMgr = [[objc_getClass("MMServiceCenter") defaultCenter] getService:objc_getClass("CGroupMgr")];
    NSString *content = MSHookIvar<id>(wrap, "m_nsLastDisplayContent");
    NSMutableArray *array = [[TKRobotConfig sharedConfig] chatRoomSensitiveArray];
    [array enumerateObjectsUsingBlock:^(NSString *text, NSUInteger idx, BOOL * _Nonnull stop) {
        if([content isEqualToString:text]) {
            [groupMgr DeleteGroupMember:wrap.m_nsFromUsr withMemberList:@[wrap.m_nsRealChatUsr] scene:3074516140857229312];
    }
    }];
}


static void _logos_method$_ungrouped$CMessageMgr$autoReplyChatRoomWithMessageWrap$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CMessageWrap * wrap) {
    BOOL autoReplyChatRoomEnable = [[TKRobotConfig sharedConfig] autoReplyChatRoomEnable];
    NSString *autoReplyChatRoomContent = [[TKRobotConfig sharedConfig] autoReplyChatRoomText];
    if (!autoReplyChatRoomEnable || autoReplyChatRoomContent == nil || [autoReplyChatRoomContent isEqualToString:@""]) {                                                     
        return;
    }

    NSString * content = MSHookIvar<id>(wrap, "m_nsLastDisplayContent");
    NSString *needAutoReplyChatRoomMsg = [[TKRobotConfig sharedConfig] autoReplyChatRoomKeyword];
    NSArray * keyWordArray = [needAutoReplyChatRoomMsg componentsSeparatedByString:@"||"];
    [keyWordArray enumerateObjectsUsingBlock:^(NSString *keyword, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([keyword isEqualToString:@"*"] || [content isEqualToString:keyword]) {
            [self sendMsg:autoReplyChatRoomContent toContactUsrName:wrap.m_nsFromUsr];
        }
    }];
}


static void _logos_method$_ungrouped$CMessageMgr$welcomeJoinChatRoomWithMessageWrap$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CMessageWrap * wrap) {
    BOOL welcomeJoinChatRoomEnable = [[TKRobotConfig sharedConfig] welcomeJoinChatRoomEnable];
    if (!welcomeJoinChatRoomEnable) return;                                     




    NSString * content = MSHookIvar<id>(wrap, "m_nsLastDisplayContent");
    NSRange rangeFrom = [content rangeOfString:@"邀请\""];
    NSRange rangeTo = [content rangeOfString:@"\"加入了群聊"];
    NSRange nameRange;
    if (rangeFrom.length > 0 && rangeTo.length > 0) {                           
        NSInteger nameLocation = rangeFrom.location + rangeFrom.length;
        nameRange = NSMakeRange(nameLocation, rangeTo.location - nameLocation);
    } else {
        NSRange range = [content rangeOfString:@"\"通过扫描\""];
        if (range.length > 0) {                                                 
            nameRange = NSMakeRange(2, range.location - 2);
        } else {
            return;
        }
    }

    NSString *welcomeJoinChatRoomText = [[TKRobotConfig sharedConfig] welcomeJoinChatRoomText];
    [self sendMsg:welcomeJoinChatRoomText toContactUsrName:wrap.m_nsFromUsr];
}


static void _logos_method$_ungrouped$CMessageMgr$addAutoVerifyWithMessageInfo$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSDictionary * info) {
    BOOL autoVerifyEnable = [[TKRobotConfig sharedConfig] autoVerifyEnable];

    if (!autoVerifyEnable)
        return;

    NSString *keyStr = [info objectForKey:@"5"];
    if ([keyStr isEqualToString:@"fmessage"]) {
        NSArray *wrapArray = [info objectForKey:@"27"];
        [self addAutoVerifyWithArray:wrapArray arrayType:TKArrayTpyeMsgWrap];
    }
}

        
static void _logos_method$_ungrouped$CMessageMgr$addAutoVerifyWithArray$arrayType$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSArray * ary, TKArrayTpye type) {
    NSMutableArray *arrHellos = [NSMutableArray array];
    [ary enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (type == TKArrayTpyeMsgWrap) {
            CPushContact *contact = [_logos_static_class_lookup$SayHelloDataLogic() getContactFrom:obj];
            [arrHellos addObject:contact];
        } else if (type == TKArrayTpyeMsgUserName) {
            FriendAsistSessionMgr *asistSessionMgr = [[_logos_static_class_lookup$MMServiceCenter() defaultCenter] getService:_logos_static_class_lookup$FriendAsistSessionMgr()];
            CMessageWrap *wrap = [asistSessionMgr GetLastMessage:@"fmessage" HelloUser:obj OnlyTo:NO];
            CPushContact *contact = [_logos_static_class_lookup$SayHelloDataLogic() getContactFrom:wrap];
            [arrHellos addObject:contact];
        }
    }];

    NSString *autoVerifyKeyword = [[TKRobotConfig sharedConfig] autoVerifyKeyword];
    for (int idx = 0;idx < arrHellos.count;idx++) {
        CPushContact *contact = arrHellos[idx];
        if (![contact isMyContact] && [contact.m_nsDes isEqualToString:autoVerifyKeyword]) {
            CContactVerifyLogic *verifyLogic = [[_logos_static_class_lookup$CContactVerifyLogic() alloc] init];
            CVerifyContactWrap *wrap = [[_logos_static_class_lookup$CVerifyContactWrap() alloc] init];
            [wrap setM_nsUsrName:contact.m_nsEncodeUserName];
            [wrap setM_uiScene:contact.m_uiFriendScene];
            [wrap setM_nsTicket:contact.m_nsTicket];
            [wrap setM_nsChatRoomUserName:contact.m_nsChatRoomUserName];
            wrap.m_oVerifyContact = contact;

            AutoSetRemarkMgr *mgr = [[_logos_static_class_lookup$MMServiceCenter() defaultCenter] getService:_logos_static_class_lookup$AutoSetRemarkMgr()];
            id attr = [mgr GetStrangerAttribute:contact AttributeName:1001];

            if([attr boolValue]) {
                [wrap setM_uiWCFlag:(wrap.m_uiWCFlag | 1)];
            }
            [verifyLogic startWithVerifyContactWrap:[NSArray arrayWithObject:wrap] opCode:3 parentView:[UIView new] fromChatRoom:NO];

            
            BOOL autoWelcomeEnable = [[TKRobotConfig sharedConfig] autoWelcomeEnable];
            NSString *autoWelcomeText = [[TKRobotConfig sharedConfig] autoWelcomeText];
            if (autoWelcomeEnable && autoWelcomeText != nil) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self sendMsg:autoWelcomeText toContactUsrName:contact.m_nsUsrName];
                });
            }
        }
    }
}

        
static void _logos_method$_ungrouped$CMessageMgr$sendMsg$toContactUsrName$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * msg, NSString * userName) {
    CMessageWrap *wrap = [[_logos_static_class_lookup$CMessageWrap() alloc] initWithMsgType:1];
    id usrName = [_logos_static_class_lookup$SettingUtil() getLocalUsrName:0];
    [wrap setM_nsFromUsr:usrName];
    [wrap setM_nsContent:msg];
    [wrap setM_nsToUsr:userName];
    MMNewSessionMgr *sessionMgr = [[_logos_static_class_lookup$MMServiceCenter() defaultCenter] getService:_logos_static_class_lookup$MMNewSessionMgr()];
    [wrap setM_uiCreateTime:[sessionMgr GenSendMsgTime]];
    [wrap setM_uiStatus:YES];

    CMessageMgr *chatMgr = [[_logos_static_class_lookup$MMServiceCenter() defaultCenter] getService:_logos_static_class_lookup$CMessageMgr()];
    [chatMgr AddMsg:userName MsgWrap:wrap];
}













































static NSInteger _logos_method$_ungrouped$WCDeviceStepObject$m7StepCount(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSInteger stepCount = _logos_orig$_ungrouped$WCDeviceStepObject$m7StepCount(self, _cmd);
    NSInteger newStepCount = [[TKRobotConfig sharedConfig] deviceStep];
    BOOL changeStepEnable = [[TKRobotConfig sharedConfig] changeStepEnable];

    return changeStepEnable ? newStepCount : stepCount;
}

static NSInteger _logos_method$_ungrouped$WCDeviceStepObject$hkStepCount(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSInteger stepCount = _logos_orig$_ungrouped$WCDeviceStepObject$hkStepCount(self, _cmd);
    NSInteger newStepCount = [[TKRobotConfig sharedConfig] deviceStep];
    BOOL changeStepEnable = [[TKRobotConfig sharedConfig] changeStepEnable];

    return changeStepEnable ? newStepCount : stepCount;
}



static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$CMessageMgr = objc_getClass("CMessageMgr"); MSHookMessageEx(_logos_class$_ungrouped$CMessageMgr, @selector(AddEmoticonMsg:MsgWrap:), (IMP)&_logos_method$_ungrouped$CMessageMgr$AddEmoticonMsg$MsgWrap$, (IMP*)&_logos_orig$_ungrouped$CMessageMgr$AddEmoticonMsg$MsgWrap$);MSHookMessageEx(_logos_class$_ungrouped$CMessageMgr, @selector(MessageReturn:MessageInfo:Event:), (IMP)&_logos_method$_ungrouped$CMessageMgr$MessageReturn$MessageInfo$Event$, (IMP*)&_logos_orig$_ungrouped$CMessageMgr$MessageReturn$MessageInfo$Event$);MSHookMessageEx(_logos_class$_ungrouped$CMessageMgr, @selector(GetHelloUsers:Limit:OnlyUnread:), (IMP)&_logos_method$_ungrouped$CMessageMgr$GetHelloUsers$Limit$OnlyUnread$, (IMP*)&_logos_orig$_ungrouped$CMessageMgr$GetHelloUsers$Limit$OnlyUnread$);MSHookMessageEx(_logos_class$_ungrouped$CMessageMgr, @selector(onRevokeMsg:), (IMP)&_logos_method$_ungrouped$CMessageMgr$onRevokeMsg$, (IMP*)&_logos_orig$_ungrouped$CMessageMgr$onRevokeMsg$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(CMessageWrap *), strlen(@encode(CMessageWrap *))); i += strlen(@encode(CMessageWrap *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$CMessageMgr, @selector(autoReplyWithMessageWrap:), (IMP)&_logos_method$_ungrouped$CMessageMgr$autoReplyWithMessageWrap$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(CMessageWrap *), strlen(@encode(CMessageWrap *))); i += strlen(@encode(CMessageWrap *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$CMessageMgr, @selector(removeMemberWithMessageWrap:), (IMP)&_logos_method$_ungrouped$CMessageMgr$removeMemberWithMessageWrap$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(CMessageWrap *), strlen(@encode(CMessageWrap *))); i += strlen(@encode(CMessageWrap *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$CMessageMgr, @selector(autoReplyChatRoomWithMessageWrap:), (IMP)&_logos_method$_ungrouped$CMessageMgr$autoReplyChatRoomWithMessageWrap$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(CMessageWrap *), strlen(@encode(CMessageWrap *))); i += strlen(@encode(CMessageWrap *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$CMessageMgr, @selector(welcomeJoinChatRoomWithMessageWrap:), (IMP)&_logos_method$_ungrouped$CMessageMgr$welcomeJoinChatRoomWithMessageWrap$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSDictionary *), strlen(@encode(NSDictionary *))); i += strlen(@encode(NSDictionary *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$CMessageMgr, @selector(addAutoVerifyWithMessageInfo:), (IMP)&_logos_method$_ungrouped$CMessageMgr$addAutoVerifyWithMessageInfo$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSArray *), strlen(@encode(NSArray *))); i += strlen(@encode(NSArray *)); memcpy(_typeEncoding + i, @encode(TKArrayTpye), strlen(@encode(TKArrayTpye))); i += strlen(@encode(TKArrayTpye)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$CMessageMgr, @selector(addAutoVerifyWithArray:arrayType:), (IMP)&_logos_method$_ungrouped$CMessageMgr$addAutoVerifyWithArray$arrayType$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSString *), strlen(@encode(NSString *))); i += strlen(@encode(NSString *)); memcpy(_typeEncoding + i, @encode(NSString *), strlen(@encode(NSString *))); i += strlen(@encode(NSString *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$CMessageMgr, @selector(sendMsg:toContactUsrName:), (IMP)&_logos_method$_ungrouped$CMessageMgr$sendMsg$toContactUsrName$, _typeEncoding); }Class _logos_class$_ungrouped$WCDeviceStepObject = objc_getClass("WCDeviceStepObject"); MSHookMessageEx(_logos_class$_ungrouped$WCDeviceStepObject, @selector(m7StepCount), (IMP)&_logos_method$_ungrouped$WCDeviceStepObject$m7StepCount, (IMP*)&_logos_orig$_ungrouped$WCDeviceStepObject$m7StepCount);MSHookMessageEx(_logos_class$_ungrouped$WCDeviceStepObject, @selector(hkStepCount), (IMP)&_logos_method$_ungrouped$WCDeviceStepObject$hkStepCount, (IMP*)&_logos_orig$_ungrouped$WCDeviceStepObject$hkStepCount);} }
#line 338 "/Users/Tozy/Documents/GitHub/WeChatPluginWrapperiOS/SharedFiles/TKkk/TKkkTweak.xm"
