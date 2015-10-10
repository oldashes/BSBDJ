//
//  TXTabBar.m
//  BSBDJ
//
//  Created by TimXu on 9/28/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "TXTabBar.h"
#import "UIView+TXExtension.h"

@interface TXTabBar()

/** description */
@property (nonatomic, weak) UIButton *publishButton;

@end

@implementation TXTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIButton *)publishButton
{
    if (!_publishButton) {
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishButton sizeToFit];
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        _publishButton = publishButton;
    }
    return _publishButton;
}

- (void)publishClick{
    TXLogFunc;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
//    self.publishButton.centerX = self.width * 0.5;
//    self.publishButton.centerY = self.height * 0.5;
    self.publishButton.center = CGPointMake(self.width * 0.5, self.height * 0.5);
    
    
    CGFloat buttonW = self.width / 5;
    CGFloat index = 0;
    
    for (UIButton *button in self.subviews) {
        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        
        button.width = buttonW;
        button.x = index * buttonW;
        
        if (index > 1) button.x += buttonW;
     
        index++;
    }
    
}

@end
