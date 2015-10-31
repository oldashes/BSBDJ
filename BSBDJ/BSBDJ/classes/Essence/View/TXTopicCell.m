//
//  TXTopicCell.m
//  BSBDJ
//
//  Created by TimXu on 10/30/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "TXTopicCell.h"
#import "TXTopic.h"

@interface TXTopicCell()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;
@property (weak, nonatomic) IBOutlet UILabel *text_label;
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *repostButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@end

@implementation TXTopicCell

- (void)awakeFromNib {
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
}

- (void)setTopic:(TXTopic *)topic{
    _topic = topic;
    
    [self.profileImageView setHeaderWithURL:topic.profile_image];
    self.nameLabel.text = topic.name;
    self.text_label.text = topic.text;
    self.createdAtLabel.text = topic.created_at;
    
//    [self.dingButton setTitle:[NSString stringWithFormat:@"%zd", topic.ding] forState:UIControlStateNormal];
//    [self.caiButton setTitle:[NSString stringWithFormat:@"%zd", topic.cai] forState:UIControlStateNormal];
//    [self.repostButton setTitle:[NSString stringWithFormat:@"%zd", topic.repost] forState:UIControlStateNormal];
//    [self.commentButton setTitle:[NSString stringWithFormat:@"%zd", topic.comment] forState:UIControlStateNormal];
    
    [self setButton:self.dingButton number:topic.ding title:@"顶"];
    [self setButton:self.caiButton number:topic.cai title:@"踩"];
    [self setButton:self.repostButton number:topic.repost title:@"分享"];
    [self setButton:self.commentButton number:topic.comment title:@"评论"];
}
/**
 *  设置底部按钮的数字显示
 *
 *  @param button 按钮
 *  @param number 数字大于10000时，写为1万
 *  @param title  当数字为零时，显示 title 文字
 */
- (void)setButton:(UIButton *)button number:(NSInteger)number title:(NSString *)title{
    if (number >= 10000) {
        [button setTitle:[NSString stringWithFormat:@"%.1f万", number / 10000.0] forState:UIControlStateNormal];
    } else if (number == 0){
        [button setTitle:title forState:UIControlStateNormal];
    } else {
        [button setTitle:[NSString stringWithFormat:@"%zd", number] forState:UIControlStateNormal];
    }
}

- (void)setFrame:(CGRect)frame{
    frame.size.height -= TXMargin;
    [super setFrame:frame];
    TXLog(@"%f", self.frame.size.height);
}
@end
