//
//  TXRecommendTagViewController.m
//  BSBDJ
//
//  Created by TimXu on 10/10/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "TXRecommendTagViewController.h"
#import "TXRecommendTagViewCell.h"
#import "TXRecommendTag.h"
#import "AFNetworking.h"
#import "MJExtension.h"

@interface TXRecommendTagViewController ()
/** recommendTags */
@property (nonatomic, strong) NSArray *recommendTags;
@end


@implementation TXRecommendTagViewController

static NSString *const  ID = @"recommendTag";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"推荐标签";
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TXRecommendTagViewCell class])bundle:nil] forCellReuseIdentifier:ID];
    
    self.tableView.rowHeight = 70;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = TXCommonBgColor;
    
    [self loadNewRecommendTags];
}

- (void)loadNewRecommendTags{
    
    // 请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"a"] = @"tag_recommend";
    params[@"action"] = @"sub";
    params[@"c"] = @"topic";
    
    // 发送请求
    [[AFHTTPSessionManager manager] GET:TXRequestURL parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        self.recommendTags = [TXRecommendTag objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        TXLog(@"%@ , loading failed", error);
    }];
    
    
}



#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.recommendTags.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TXRecommendTagViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.recommendTag = self.recommendTags[indexPath.row];
    
    return cell;
}

@end
