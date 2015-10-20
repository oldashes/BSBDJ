//
//  TXMeCell.m
//  BSBDJ
//
//  Created by TimXu on 10/16/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "TXMeCell.h"

@implementation TXMeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
        self.textLabel.textColor = [UIColor darkGrayColor];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.imageView.image == nil) return;
    
    self.imageView.height = self.contentView.height - TXMargin;
    self.imageView.width = self.imageView.height;
    self.imageView.centerY = self.contentView.height * 0.5;
    
    self.textLabel.x = self.imageView.right + TXMargin;
}
@end
