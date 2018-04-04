//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  WeChatPluginWrapperiOSDylib.m
//  WeChatPluginWrapperiOSDylib
//
//  Created by TozyZuo on 2018/3/30.
//  Copyright (c) 2018年 TozyZuo. All rights reserved.
//

#import "WeChatPluginWrapperiOSDylib.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>
#import <Cycript/Cycript.h>
#import "WeChatPluginSettingViewController.h"
#import "WeChatHeader.h"

CHConstructor{
    NSLog(INSERT_SUCCESS_WELCOME);
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
#ifndef __OPTIMIZE__
        CYListenServer(6666);
#endif
        
    }];
}

CHDeclareClass(NewSettingViewController)
CHOptimizedMethod0(self, void, NewSettingViewController, reloadTableData)
{
    CHSuper0(NewSettingViewController, reloadTableData);

    MMTableViewInfo *tableViewInfo = CHIvar(self, m_tableViewInfo, __strong MMTableViewInfo *);
    MMTableViewSectionInfo *sectionInfo = [objc_getClass("MMTableViewSectionInfo") sectionInfoDefaut];
    MMTableViewCellInfo *settingCell = [objc_getClass("MMTableViewCellInfo") normalCellForSel:@selector(pluginSetting) target:self title:@"插件设置" accessoryType:1];
    [sectionInfo addCell:settingCell];
    [tableViewInfo insertSection:sectionInfo At:0];
    MMTableView *tableView = [tableViewInfo getTableView];
    [tableView reloadData];
}

CHDeclareMethod0(void, NewSettingViewController, pluginSetting)
{
    [self.navigationController PushViewController:[[WeChatPluginSettingViewController alloc] init] animated:YES];
}

CHConstructor {
    CHLoadLateClass(NewSettingViewController);
    CHHook0(NewSettingViewController, reloadTableData);
}


