//
//  TXNewViewController.m
//  BSBDJ
//
//  Created by TimXu on 9/18/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "TXNewViewController.h"

@implementation TXNewViewController
- (void)viewDidLoad{
    self.view.backgroundColor = TXCommonBgColor;
    
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self aciton:@selector(tagSubClick) image:@"MainTagSubIcon" highlightImage:@"MainTagSubIconClick"];
}

- (void)tagSubClick
{
    TXLogFunc;
}
@end
