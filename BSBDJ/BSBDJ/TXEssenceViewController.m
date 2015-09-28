//
//  TXEssenceViewController.m
//  BSBDJ
//
//  Created by TimXu on 9/18/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "TXEssenceViewController.h"

@implementation TXEssenceViewController

- (void)viewDidLoad{

    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self aciton:@selector(tagSubClick) image:@"MainTagSubIcon" highlightImage:@"MainTagSubIconClick"];
}

- (void)tagSubClick
{
    TXLogFunc;
}

@end
