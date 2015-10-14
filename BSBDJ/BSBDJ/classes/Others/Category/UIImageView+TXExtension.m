//
//  UIImageView+TXExtension.m
//  BSBDJ
//
//  Created by TimXu on 10/13/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "UIImageView+TXExtension.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (TXExtension)

- (void)setHeaderWithURL:(NSString *)url{
    [self setCircleHeaderWithURL:url];
}

- (void)setCircleHeaderWithURL:(NSString *)url{
    UIImage *placehoder = [UIImage imageNamed:@"defaultUserIcon"];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placehoder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image == nil) return;
        
        self.image = [image circleImage];
    }];
}

- (void)setRectHeaderWithURL:(NSString *)url{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}
@end
