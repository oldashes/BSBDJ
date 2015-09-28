//
//  TXNavigationController.m
//  BSBDJ
//
//  Created by TimXu on 9/27/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "TXNavigationController.h"

@interface TXNavigationController ()

@end

@implementation TXNavigationController

+ (void)initialize{
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [bar setTitleTextAttributes:attrs];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate = nil;
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIButton *btn = [[UIButton alloc] init];
        [btn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [btn setTitle:@"返回" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:TXColor(251, 32, 37)  forState:UIControlStateHighlighted];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [btn sizeToFit];
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    
//    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style: UIBarButtonItemStyleDone target:nil action:nil];
    [super pushViewController:viewController animated:YES];

}

- (void)back{
 
    [self popViewControllerAnimated:YES];
}
                                 
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
