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
    self.navigationItem.title = @"我的关注";

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self aciton:@selector(friendsRecommentClick) image:@"friendsRecommentIcon" highlightImage:@"friendsRecommentIcon-click"];
}

-(void)friendsRecommentClick{
    TXLogFunc;
}
@end
