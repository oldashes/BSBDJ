//
//  UITextField+TXExtension.m
//  BSBDJ
//
//  Created by TimXu on 10/8/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "UITextField+TXExtension.h"

//#define TXPlaceholderColorKey @"placeholderLabel.textColor"
static NSString * const TXPlaceholderColorKey = @"placeholderLabel.textColor";

@implementation UITextField (TXExtension)

- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    if (placeholderColor == nil) { // 占位文字颜色为空，则设置默认颜色
        
        [self setValue:TXGrayColor(255 * 0.7) forKeyPath:TXPlaceholderColorKey];
        
    } else {
        
        /*
         目的是防止在设置TextField属性时，先设置颜色再设置占位文字。
         */
        NSString *placeholder = self.placeholder; // 获得占位文字
        
        self.placeholder = @" "; // 设置占位文字为空
        
        [self setValue:placeholderColor forKeyPath:TXPlaceholderColorKey]; // 设置占位文字颜色
        
        self.placeholder = placeholder; // 还原占位文字
    }
    
}

- (UIColor *)placeholderColor{
    return [self valueForKey:TXPlaceholderColorKey];
}

@end
