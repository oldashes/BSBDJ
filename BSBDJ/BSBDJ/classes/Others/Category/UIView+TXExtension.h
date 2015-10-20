//
//  UIView+TXExtension.h
//  BSBDJ
//
//  Created by TimXu on 9/28/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TXExtension)
/** width */
@property (nonatomic, assign) CGFloat width;
/** height */
@property (nonatomic, assign) CGFloat height;
/** x */
@property (nonatomic, assign) CGFloat x;
/** y */
@property (nonatomic, assign) CGFloat y;
/** center */
@property (nonatomic, assign) CGFloat centerX;
/** center */
@property (nonatomic, assign) CGFloat centerY;

/** 控件最左边那根线的位置(minX的位置) */
@property (nonatomic, assign) CGFloat left;
/** 控件最右边那根线的位置(maxX的位置) */
@property (nonatomic, assign) CGFloat right;
/** 控件最顶部那根线的位置(minY的位置) */
@property (nonatomic, assign) CGFloat top;
/** 控件最底部那根线的位置(maxY的位置) */
@property (nonatomic, assign) CGFloat bottom;
@end
