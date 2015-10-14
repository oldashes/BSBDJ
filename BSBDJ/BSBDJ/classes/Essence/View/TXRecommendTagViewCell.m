//
//  TXRecommendTagViewCell.m
//  BSBDJ
//
//  Created by TimXu on 10/10/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "TXRecommendTagViewCell.h"
#import "TXRecommendTag.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface TXRecommendTagViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageListView;
@property (weak, nonatomic) IBOutlet UILabel *themeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subNumberLabel;

@end

@implementation TXRecommendTagViewCell

- (void)setRecommendTag:(TXRecommendTag *)recommendTag{
    _recommendTag = recommendTag;
    
    
    // 头像
//    [self.imageListView sd_setImageWithURL:[NSURL URLWithString:recommendTag.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    [self.imageListView setHeaderWithURL:recommendTag.image_list];
    
    // 名字
    self.themeNameLabel.text = recommendTag.theme_name;
    
    // 订阅数
    if (recommendTag.sub_number >= 10000) {
        self.subNumberLabel.text = [NSString stringWithFormat:@"%.2f人订阅", recommendTag.sub_number / 10000.0];
    } else {
        
        self.subNumberLabel.text = [NSString stringWithFormat:@"%zd人订阅", recommendTag.sub_number];
    }
    
}

/**
 *  重写setFrame
 */
- (void)setFrame:(CGRect)frame{
    frame.size.height -= 1;
    [super setFrame:frame];
}
@end
