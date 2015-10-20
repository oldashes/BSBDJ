//
//  TXMeSquareButton.m
//  BSBDJ
//
//  Created by TimXu on 10/16/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "TXMeSquareButton.h"
#import "TXMeSquare.h"
#import <UIButton+WebCache.h>

@implementation TXMeSquareButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [ super initWithFrame:frame]) {
        [self setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.width = self.width * 0.5;
    self.imageView.height = self.imageView.width;
    self.imageView.y = self.height * 0.1;
//    self.imageView.centerX = self.centerX;
    self.imageView.centerX = self.width * 0.5;
//    TXLog(@"%f --- %f", self.centerX, self.width*0.5);
    
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.y + self.imageView.height;
//    self.titleLabel.y = self.imageView.bottom;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
}

- (void)setSquare:(TXMeSquare *)square
{
    _square = square;
    [self setTitle:square.name forState:UIControlStateNormal];
    [self sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:UIControlStateNormal placeholderImage:[UIImage circleImageNamed:@"defaultUserIcon"]];
}

@end
