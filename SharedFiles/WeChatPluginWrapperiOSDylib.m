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

    WCTableViewManager *manager = self.tableViewManager;

    WCTableViewSectionManager *section = [objc_getClass("WCTableViewSectionManager") defaultSection];
    WCTableViewNormalCellManager *cell = [objc_getClass("WCTableViewNormalCellManager") normalCellForSel:@selector(pluginSetting) target:self title:@"插件设置" accessoryType:1];
    [section addCell:cell];
    [manager insertSection:section At:0];

    MMTableView *tableView = [manager getTableView];
    [tableView reloadData];
}

CHDeclareMethod0(void, NewSettingViewController, pluginSetting)
{
    [self.navigationController PushViewController:[[WeChatPluginSettingViewController alloc] init] animated:YES];
}

CHDeclareMethod0(WCTableViewManager *, NewSettingViewController, tableViewManager)
{
    return CHIvar(self, m_tableViewMgr, __strong WCTableViewManager *);
}

CHConstructor {
    CHLoadLateClass(NewSettingViewController);
    CHHook0(NewSettingViewController, reloadTableData);
}


