//
//  UIImage+TXExtension.m
//  BSBDJ
//
//  Created by TimXu on 10/13/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "UIImage+TXExtension.h"

@implementation UIImage (TXExtension)
- (instancetype)circleImage{
    UIGraphicsBeginImageContext(self.size);
    
    CGContextRef content = UIGraphicsGetCurrentContext();
    
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(content, rect);
    
    CGContextClip(content);
    
    [self drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

+ (instancetype)circleImageNamed:(NSString *)name{
    
    return [self imageNamed:name].circleImage;
}
@end
