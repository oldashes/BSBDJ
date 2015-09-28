//
//  UIBarButtonItem+TXExtension.h
//  BSBDJ
//
//  Created by TimXu on 9/20/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (TXExtension)
+ (instancetype)itemWithTarget:(id)target aciton:(SEL)action image:(NSString *)image highlightImage:(NSString *)highlightImage;
@end
