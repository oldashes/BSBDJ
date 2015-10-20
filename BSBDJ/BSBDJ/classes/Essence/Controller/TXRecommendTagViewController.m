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
//#import <AFNetworking.h>
#import "TXHTTPSessionManager.h"
#import <MJExtension.h>
#import <SVProgressHUD.h>

@interface TXRecommendTagViewController ()
/** recommendTags */
@property (nonatomic, strong) NSArray *recommendTags;
/** sessionManager */
@property (nonatomic, strong) TXHTTPSessionManager *manager;
@end


@implementation TXRecommendTagViewController

// 懒加载
- (TXHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [TXHTTPSessionManager manager];
    }
    return _manager;
}

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
    
   // 声明一个弱引用对象，用于block，当self需要死掉时，不被block强引用而无法去死
    __weak typeof(self) weakSelf = self;
    
    [SVProgressHUD show];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 请求参数
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        
        params[@"a"] = @"tag_recommend";
        params[@"action"] = @"sub";
        params[@"c"] = @"topic";
        
        // 发送请求
        [self.manager GET:TXRequestURL parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
            
            weakSelf.recommendTags = [TXRecommendTag objectArrayWithKeyValuesArray:responseObject];
            [weakSelf.tableView reloadData];
            
            [SVProgressHUD dismiss];
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            
            
            [SVProgressHUD showErrorWithStatus:@"loading failed"];
//            TXLog(@"%@ , loading failed", error);
        }];
    });
    
}

- (void)dealloc{
    // 返回则控制器死去
}


- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:YES];
    
    [SVProgressHUD dismiss];
    
    
    // 使session无效，则所有任务取消
    [self.manager invalidateSessionCancelingTasks:YES];
    
    // 取消所有任务
//    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
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
