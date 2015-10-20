//
//  TXMeViewController.m
//  BSBDJ
//
//  Created by TimXu on 9/18/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "TXMeViewController.h"
#import "TXSettingViewController.h"
#import "TXMeCell.h"
#import "TXMeFooter.h"

@implementation TXMeViewController
static NSString * const TXMeCellId = @"me";

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self setupTable];
    
    [self setupNav];

}

// 设置表格
- (void)setupTable{
    
    self.tableView.backgroundColor = TXCommonBgColor;
    [self.tableView registerClass:[TXMeCell class] forCellReuseIdentifier:TXMeCellId];
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = TXMargin;
    self.tableView.contentInset = UIEdgeInsetsMake(TXMargin - TXGroupFirstCellY, 0, 0, 0);
    
    self.tableView.tableFooterView = [[TXMeFooter alloc] init];
    
    
    
}

// 设置导航
- (void)setupNav{
    
    self.view.backgroundColor = TXCommonBgColor;
    
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithTarget:self aciton:@selector(settingClick) image:@"mine-setting-icon" highlightImage:@"mine-setting-icon-click"];
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithTarget:self aciton:@selector(moonClick) image:@"mine-moon-icon" highlightImage:@"mine-moon-icon-click"];
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
    
    //    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
    //    self.navigationItem.backBarButtonItem.tintColor = [UIColor blackColor]; // 没卵用
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    //    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
}

#pragma mark - 监听
- (void)settingClick{
    TXSettingViewController *setting = [[TXSettingViewController alloc] init];
    
    [self.navigationController pushViewController:setting animated:YES];
    TXLogFunc;
}

- (void)moonClick{
    TXLogFunc;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TXMeCell *cell = [tableView dequeueReusableCellWithIdentifier:TXMeCellId];
    
    if (indexPath.section == 0) {
        cell.textLabel.text = @"登录／注册";
        cell.imageView.image = [UIImage imageNamed:@"publish-audio"];
    } else {
        cell.textLabel.text = @"离线下载";
        cell.imageView.image = nil;
    }
    return cell;
}
@end
