//
//  TXFriendTrendsViewController.m
//  BSBDJ
//
//  Created by TimXu on 9/18/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "TXFriendTrendsViewController.h"

@implementation TXFriendTrendsViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = TXCommonBgColor;
    
    self.navigationItem.title = @"我的关注";

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self aciton:@selector(friendsRecommentClick) image:@"friendsRecommentIcon" highlightImage:@"friendsRecommentIcon-click"];
}

- (void)friendsRecommentClick{
    TXLogFunc;
}
/**
 *  利用exit来做统一退出操作
 *  必须先在要回到的控制器里写返回方法，然后在exit上选择此方法，连接退出按钮
 *  @param segue 利用此参数可以做一些操作
 */
- (IBAction)backToFriendTrendsViewController:(UIStoryboardSegue *) segue{
    TXLog(@"从%@控制器回来的", segue.sourceViewController);
}
@end
