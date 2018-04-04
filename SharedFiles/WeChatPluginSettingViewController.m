//
//  WeChatPluginSettingViewController.m
//  WeChatDylib
//
//  Created by TozyZuo on 2018/3/29.
//  Copyright © 2018年 TozyZuo. All rights reserved.
//

#import "WeChatPluginSettingViewController.h"
#import "WeChatHeader.h"
#import <objc/runtime.h>

@interface WeChatPluginSettingViewController ()
@property (nonatomic, strong) MMTableViewInfo *tableViewInfo;
@property (nonatomic, strong) NSDictionary *redirectMap;
@end

@implementation WeChatPluginSettingViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // 增加对iPhone X的屏幕适配
        CGRect winSize = [UIScreen mainScreen].bounds;
        if (winSize.size.height == 812) { // iPhone X 高为812
            winSize.size.height -= 88;
            winSize.origin.y = 88;
        }
        _tableViewInfo = [[objc_getClass("MMTableViewInfo") alloc] initWithFrame:winSize style:UITableViewStyleGrouped];
        self.redirectMap = @{@"AloneMonkey": @"WechatMapViewController",
                             @"Buginux": @"WBSettingViewController",
                             @"TKkk": @"TKSettingViewController",
                             @"TozyZuo": @"TZWCPSettingViewController",
                             };
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"插件配置";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0]}];

    [self reloadTableData];
    [self.view addSubview:[self.tableViewInfo getTableView]];
}

- (void)reloadTableData
{
    [self.tableViewInfo clearAllSection];
    [self addAloneMonkeySection];
    [self addBuginuxSection];
    [self addTKkkSection];
    [self addTozyZuoSection];

    MMTableView *tableView = [self.tableViewInfo getTableView];
    [tableView reloadData];
}

- (void)addAloneMonkeySection
{
    MMTableViewSectionInfo *sectionInfo = [objc_getClass("MMTableViewSectionInfo") sectionInfoHeader:@"AloneMonkey" Footer:nil];
    [sectionInfo addCell:[objc_getClass("MMTableViewCellInfo") normalCellForSel:NSSelectorFromString(@"AloneMonkey") target:self title:@"修改定位" accessoryType:UITableViewCellAccessoryDisclosureIndicator]];

    [self.tableViewInfo addSection:sectionInfo];
}

- (void)AloneMonkey
{
    [self.navigationController PushViewController:[[NSClassFromString(self.redirectMap[NSStringFromSelector(_cmd)]) alloc] init] animated:YES];
}

- (void)addBuginuxSection
{
    MMTableViewSectionInfo *sectionInfo = [objc_getClass("MMTableViewSectionInfo") sectionInfoHeader:@"Buginux" Footer:nil];
    [sectionInfo addCell:[objc_getClass("MMTableViewCellInfo") normalCellForSel:NSSelectorFromString(@"Buginux") target:self title:@"抢红包设置" accessoryType:UITableViewCellAccessoryDisclosureIndicator]];

    [self.tableViewInfo addSection:sectionInfo];
}

- (void)Buginux
{
    [self.navigationController PushViewController:[[NSClassFromString(self.redirectMap[NSStringFromSelector(_cmd)]) alloc] init] animated:YES];
}

- (void)addTKkkSection
{
    MMTableViewSectionInfo *sectionInfo = [objc_getClass("MMTableViewSectionInfo") sectionInfoHeader:@"TKkk" Footer:nil];
    [sectionInfo addCell:[objc_getClass("MMTableViewCellInfo") normalCellForSel:NSSelectorFromString(@"TKkk") target:self title:@"微信小助手" accessoryType:UITableViewCellAccessoryDisclosureIndicator]];

    [self.tableViewInfo addSection:sectionInfo];
}

- (void)TKkk
{
    [self.navigationController PushViewController:[[NSClassFromString(self.redirectMap[NSStringFromSelector(_cmd)]) alloc] init] animated:YES];
}

- (void)addTozyZuoSection
{
    MMTableViewSectionInfo *sectionInfo = [objc_getClass("MMTableViewSectionInfo") sectionInfoHeader:@"TozyZuo" Footer:nil];
    [sectionInfo addCell:[objc_getClass("MMTableViewCellInfo") normalCellForSel:NSSelectorFromString(@"TozyZuo") target:self title:@"WeChatPlugin" accessoryType:UITableViewCellAccessoryDisclosureIndicator]];

    [self.tableViewInfo addSection:sectionInfo];
}

- (void)TozyZuo
{
    [self.navigationController PushViewController:[[NSClassFromString(self.redirectMap[NSStringFromSelector(_cmd)]) alloc] init] animated:YES];
}

@end
