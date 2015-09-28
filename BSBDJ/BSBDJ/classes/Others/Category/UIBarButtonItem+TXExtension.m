//
//  UIBarButtonItem+TXExtension.m
//  BSBDJ
//
//  Created by TimXu on 9/20/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "UIBarButtonItem+TXExtension.h"

@implementation UIBarButtonItem (TXExtension)
+ (instancetype)itemWithTarget:(id)target aciton:(SEL)action image:(NSString *)image highlightImage:(NSString *)highlightImage{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    return [[self alloc] initWithCustomView:button];
}
@end
