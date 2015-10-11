//
//  TXRecommendTag.h
//  BSBDJ
//
//  Created by TimXu on 10/10/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TXRecommendTag : NSObject
/** name */
@property (nonatomic, copy) NSString *theme_name;
/** image */
@property (nonatomic, copy) NSString *image_list;
/** sub */
@property (nonatomic, assign) NSInteger sub_number;
@end
