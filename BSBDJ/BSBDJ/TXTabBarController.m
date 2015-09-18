//
//  TXTabBarController.m
//  BSBDJ
//
//  Created by TimXu on 9/18/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "TXTabBarController.h"
#import "TXEssenceViewController.h"
#import "TXNewViewController.h"
#import "TXFriendTrendsViewController.h"
#import "TXMeViewController.h"

@implementation TXTabBarController

- (void)viewDidLoad{
    [self setUpAllChildVces];
    [self setUpAttrs];
}

- (void)setUpAllChildVces
{
    [self setUpChildVc:[[TXEssenceViewController alloc] init] title:@"精华" image:@"tabBar_essence_icon"  selectedImage:@"tabBar_essence_click_icon"];
    [self setUpChildVc:[[TXNewViewController alloc] init] title:@"新闻" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    [self setUpChildVc:[[TXFriendTrendsViewController alloc] init] title:@"动态" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    [self setUpChildVc:[[TXMeViewController alloc] init] title:@"我" image:@"tabBar_me_click_icon" selectedImage:@"tabBar_me_click_icon"];
}

- (void)setUpChildVc:(UIViewController *) vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    [self addChildViewController:vc];
}

- (void)setUpAttrs
{
    UITabBarItem *items = [UITabBarItem appearance];
    
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [items setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [items setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
}

@end
