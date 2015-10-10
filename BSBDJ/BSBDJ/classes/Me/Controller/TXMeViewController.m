//
//  TXMeViewController.m
//  BSBDJ
//
//  Created by TimXu on 9/18/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "TXMeViewController.h"
#import "TXSettingViewController.h"

@implementation TXMeViewController
- (void)viewDidLoad{
    
    self.view.backgroundColor = TXCommonBgColor;
    
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithTarget:self aciton:@selector(settingClick) image:@"mine-setting-icon" highlightImage:@"mine-setting-icon-click"];
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithTarget:self aciton:@selector(moonClick) image:@"mine-moon-icon" highlightImage:@"mine-moon-icon-click"];
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
    
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
//    self.navigationItem.backBarButtonItem.tintColor = [UIColor blackColor]; // 没卵用
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
//    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];

}

- (void)settingClick{
    TXSettingViewController *setting = [[TXSettingViewController alloc] init];
    
    [self.navigationController pushViewController:setting animated:YES];
    TXLogFunc;
}

- (void)moonClick{
    TXLogFunc;
}
@end
