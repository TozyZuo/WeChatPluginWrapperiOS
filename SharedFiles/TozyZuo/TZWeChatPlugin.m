//
//  TZWeChatPlugin.m
//  WeChatDylib
//
//  Created by TozyZuo on 2018/3/28.
//  Copyright © 2018年 TozyZuo. All rights reserved.
//

#import "TZWeChatPlugin.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>
#import "TZWeChatPluginConfig.h"
#import "WeChatHeader.h"
#import "UIView+Layout.h"
#import "NSDate+TZCategory.h"

NSString *TZTimeStringFromTime(NSTimeInterval time)
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];

    static NSDateFormatter *formatter;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
    });

    if (date.isThisYear && ![TZWeChatPluginConfig sharedConfig].displayWholeTimeEnable)
    {
        if (date.isToday)
        {
            formatter.dateFormat = @"ahh:mm:ss";
            return [formatter stringFromDate:date];
        }
        else if (date.isYesterday)
        {
            formatter.dateFormat = @"ahh:mm:ss";
            return [NSString stringWithFormat:@"昨天 %@", [formatter stringFromDate:date]];
        }
        else if ((ABS([[NSDate date] timeIntervalSinceDate:date]) < D_WEEK))
        {
            formatter.dateFormat = @"ahh:mm:ss";
            NSString *time = [formatter stringFromDate:date];
            formatter.dateFormat = @"EEEE";
            return [NSString stringWithFormat:@"%@ %@", [formatter stringFromDate:date], time];
        }
        else
        {
            formatter.dateFormat = @"MM-dd ahh:mm:ss";
            return [formatter stringFromDate:date];
        }
    } else {
        formatter.dateFormat = @"yyyy-MM-dd ahh:mm:ss";
        return [formatter stringFromDate:date];
    }

    return [formatter stringFromDate:date];
}

CHDeclareClass(ChatTimeViewModel)
CHOptimizedMethod1(self, CGSize, ChatTimeViewModel, measure, CGSize, arg1)
{
    if (![TZWeChatPluginConfig sharedConfig].timeDisplayEnable) {
        return CHSuper1(ChatTimeViewModel, measure, arg1);
    }
    
    CGSize ret = CHSuper1(ChatTimeViewModel, measure, arg1);
    if ([TZWeChatPluginConfig sharedConfig].hideWeChatTimeEnable) {
        ret.height = 0; // 有点SB但简单的做法
    }
    return ret;
}

@interface BaseMessageViewModel (TZWeChatPlugin)
@property (nonatomic) BOOL originShowChatRoomDisplayName;
@end

CHDeclareClass(BaseMessageViewModel)

void *_BaseMessageViewModel_originShowChatRoomDisplayNameKey = &_BaseMessageViewModel_originShowChatRoomDisplayNameKey;

CHDeclareMethod0(BOOL, BaseMessageViewModel, originShowChatRoomDisplayName)
{
    return [objc_getAssociatedObject(self, _BaseMessageViewModel_originShowChatRoomDisplayNameKey) boolValue];
}

CHDeclareMethod1(void, BaseMessageViewModel, setOriginShowChatRoomDisplayName, BOOL, arg)
{
    objc_setAssociatedObject(self, _BaseMessageViewModel_originShowChatRoomDisplayNameKey, @(arg), OBJC_ASSOCIATION_RETAIN);
}

CHOptimizedMethod0(self, NSString *, BaseMessageViewModel, chatRoomDisplayName)
{
    NSString *displayName = CHSuper0(BaseMessageViewModel, chatRoomDisplayName);

    if (![TZWeChatPluginConfig sharedConfig].timeDisplayEnable) {
        return displayName;
    }

    BOOL showChatRoomDisplayName = self.originShowChatRoomDisplayName;

    NSTimeInterval time = self.createTime;
    // 修复长文本时间
    if ([self isKindOfClass:objc_getClass("TextMessageSubViewModel")]) {
        time = ((TextMessageSubViewModel *)self).parentModel.createTime;
    }

    displayName = [NSString stringWithFormat:@"%@%@%@", showChatRoomDisplayName ? displayName : @"", showChatRoomDisplayName ? @" " : @"", TZTimeStringFromTime(time)];

    return displayName;
}

CHDeclareClass(CommonMessageViewModel)
CHOptimizedMethod1(self, CGSize, CommonMessageViewModel, measure, CGSize, arg1)
{
    if (![TZWeChatPluginConfig sharedConfig].timeDisplayEnable) {
        return CHSuper1(CommonMessageViewModel, measure, arg1);
    }

    BOOL *ref = CHIvarRef(self, m_isShowChatRoomDisplayName, BOOL);
    BOOL originShowChatRoomDisplayName = YES;
    if (ref) {
        originShowChatRoomDisplayName = *ref;
        *ref = YES;
    }
    CGSize ret = CHSuper1(CommonMessageViewModel, measure, arg1);
    if (ref) {
        *ref = originShowChatRoomDisplayName;
    }
    return ret;
}


CHDeclareClass(CommonMessageCellView)
CHOptimizedMethod0(self, void, CommonMessageCellView, layoutInternal)
{
    if (![TZWeChatPluginConfig sharedConfig].timeDisplayEnable) {
        CHSuper0(CommonMessageCellView, layoutInternal);
        return;
    }

    CommonMessageViewModel *model = self.viewModel;
    BOOL *ref = CHIvarRef(model, m_isShowChatRoomDisplayName, BOOL);

    // 确保layout时候要展示名字
    if (ref) {
        model.originShowChatRoomDisplayName = *ref;
        *ref = YES;
    }

    CHSuper0(CommonMessageCellView, layoutInternal);

    MMCPLabel *nameLabel = CHIvar(self, m_chatRoomNameLabel, __strong MMCPLabel *);
    nameLabel.lineBreakMode = NSLineBreakByTruncatingHead;
    if (model.contact.isSelf) {
        UIView *headImageView = CHIvar(self, m_headImageView, __strong UIView *);
        [nameLabel sizeToFit];
        nameLabel.right = headImageView.left - 10;
    }

    if (ref) {
        *ref = model.originShowChatRoomDisplayName;
    }
}

CHConstructor {

    CHLoadLateClass(ChatTimeViewModel);
    CHClassHook(1,ChatTimeViewModel,measure);

    CHLoadLateClass(BaseMessageViewModel);
    CHClassHook(0,BaseMessageViewModel,chatRoomDisplayName);

    CHLoadLateClass(CommonMessageViewModel);
    CHClassHook(1,CommonMessageViewModel,measure);

    CHLoadLateClass(CommonMessageCellView);
    CHClassHook(0,CommonMessageCellView,layoutInternal);
}


CHDeclareClass(BaseMsgContentViewController)
CHOptimizedMethod0(self, void, BaseMsgContentViewController, StopRecording)
{
    CHSuper0(BaseMsgContentViewController, StopRecording);

    // delay一下错过AudioSender的isRecording标识
    if ([TZWeChatPluginConfig sharedConfig].translateMyselfVoiceEnable) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self reloadViewInteral];
        });
    }
}

CHDeclareClass(VoiceMessageViewModel)
CHOptimizedMethod1(self, CGSize, VoiceMessageViewModel, measureContentViewSize, CGSize, arg1)
{
    if ([TZWeChatPluginConfig sharedConfig].autoTranslateVoiceEnable &&
        // 没有转换信息
        !self.voiceTranslateInfo &&
        // 没有在录音
        ![[[objc_getClass("MMServiceCenter") defaultCenter] getService:objc_getClass("AudioSender")] isRecording] &&
        // 是否翻译自己
        (!self.contact.isSelf || [TZWeChatPluginConfig sharedConfig].translateMyselfVoiceEnable))
    {
        VoiceTranslateMsgMgr *voiceTranslateMsgMgr = [[objc_getClass("MMServiceCenter") defaultCenter] getService:objc_getClass("VoiceTranslateMsgMgr")];
        VoiceTranslateUtil *util = CHIvar(voiceTranslateMsgMgr, m_oVoiceTranslateUtil, __strong VoiceTranslateUtil *);
        if ([util isLocalTransResultExist:self.messageWrap]) {
            VoiceTranslateInfo *info = [[objc_getClass("VoiceTranslateInfo") alloc] init];
            info.mesLocalId = self.messageWrap.m_uiMesLocalID;
            info.messageWrap = self.messageWrap;
            info.voiceId = [util.class getVoiceIDFromMsg:self.messageWrap];
            info.bAutoScrollUp = YES;
            info.status = 2;
            info.displayText = [util getTranslateString:self.messageWrap];
            info.translatedText = info.displayText;
            self.voiceTranslateInfo = info;
        } else {
            [voiceTranslateMsgMgr translateVoiceMessage:self.messageWrap];
        }
    }

    return CHSuper1(VoiceMessageViewModel, measureContentViewSize, arg1);
}

CHConstructor{

    CHLoadLateClass(VoiceMessageViewModel);
    CHClassHook(1, VoiceMessageViewModel, measureContentViewSize);

    CHLoadLateClass(BaseMsgContentViewController);
    CHClassHook(0, BaseMsgContentViewController, StopRecording);
}
