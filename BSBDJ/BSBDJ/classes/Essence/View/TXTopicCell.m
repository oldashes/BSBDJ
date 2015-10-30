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

- (void)setTopic:(TXTopic *)topic{
    _topic = topic;
    
    [self.profileImageView setHeaderWithURL:topic.profile_image];
    self.nameLabel.text = topic.name;
    self.createdAtLabel.text = topic.created_at;
    
    [self.dingButton setTitle:[NSString stringWithFormat:@"%zd", topic.ding] forState:UIControlStateNormal];
    [self.caiButton setTitle:[NSString stringWithFormat:@"%zd", topic.cai] forState:UIControlStateNormal];
    [self.repostButton setTitle:[NSString stringWithFormat:@"%zd", topic.repost] forState:UIControlStateNormal];
    [self.commentButton setTitle:[NSString stringWithFormat:@"%zd", topic.comment] forState:UIControlStateNormal];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
