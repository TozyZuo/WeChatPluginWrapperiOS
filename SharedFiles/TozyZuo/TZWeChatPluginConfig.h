//
//  TZWeChatPluginConfig.h
//  WeChatDylib
//
//  Created by TozyZuo on 2018/3/29.
//  Copyright © 2018年 TozyZuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TZWeChatPluginConfig : NSObject

+ (instancetype)sharedConfig;
- (SEL)selectorForPropertySEL:(SEL)propertySEL;

@property (nonatomic, assign) BOOL timeDisplayEnable;
@property (nonatomic, assign) BOOL displayWholeTimeEnable;
@property (nonatomic, assign) BOOL hideWeChatTimeEnable;
@property (nonatomic, assign) BOOL fullscreenPopGestureEnable;
@property (nonatomic, assign) BOOL autoTranslateVoiceEnable;
@property (nonatomic, assign) BOOL translateMyselfVoiceEnable;

@end
