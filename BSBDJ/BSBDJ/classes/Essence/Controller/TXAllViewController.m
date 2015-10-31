//
//  TXAllViewController.m
//  BSBDJ
//
//  Created by TimXu on 10/28/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "TXAllViewController.h"
#import "TXTopic.h"
#import <MJExtension.h>
#import "TXHTTPSessionManager.h"
#import "TXTopic.h"
#import "TXTopicCell.h"

@interface TXAllViewController ()
/** 请求管理者 */
@property (nonatomic, weak) TXHTTPSessionManager *manager;
/** 贴子数据 */
@property (nonatomic, strong) NSArray *topics;
@end

@implementation TXAllViewController

static NSString * const TXTopicCellId = @"topic";
/**
 *  manager 懒加载
 */
- (TXHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [TXHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    TXLogFunc;
    // 内边距
    self.tableView.contentInset = UIEdgeInsetsMake(TXNavBarBottom + TXTitlesViewH, 0, TXTabBarH, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
//    self.tableView.contentOffset = CGPointMake(0, -104); // 这里就不需要了。
    self.tableView.rowHeight = 200; // 随便给的
    self.tableView.backgroundColor = TXCommonBgColor;
    
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TXTopicCell class]) bundle:nil] forCellReuseIdentifier:TXTopicCellId];
    
    // 加载贴子数据
    
    // 请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"type"] = @"1";
    params[@"c"] = @"data";
    
    // 发送请求
    __weak typeof(self) weakSelf = self;
    [self.manager GET:TXRequestURL parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        // 字典数组转模型数组
        weakSelf.topics = [TXTopic objectArrayWithKeyValuesArray:responseObject[@"list"]];
//        TXWriteToPlist(responseObject, @"plist");
        
        // 刷新表格
        [weakSelf.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
    
}



#pragma mark - data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
//        cell.backgroundColor = TXRandomColor;
//    }
////    cell.textLabel.text = [NSString stringWithFormat:@"%@ ---%zd", self.title, indexPath.row];
//    TXTopic *topic = self.topics[indexPath.row];
//    cell.textLabel.text = topic.name;
//    cell.detailTextLabel.text = topic.text;
//    [cell.imageView setHeaderWithURL:topic.profile_image];
//    return cell;
    
    TXTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:TXTopicCellId];
    cell.topic = self.topics[indexPath.row];
    return cell;
}

@end
