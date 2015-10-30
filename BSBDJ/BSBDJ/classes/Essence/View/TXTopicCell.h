//
//  TXTopicCell.h
//  BSBDJ
//
//  Created by TimXu on 10/30/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TXTopic;
@interface TXTopicCell : UITableViewCell
/** 贴子模型数据 */
@property (nonatomic, strong)  TXTopic *topic;
@end
