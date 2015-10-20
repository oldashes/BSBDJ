//
//  TXMeFooter.m
//  BSBDJ
//
//  Created by TimXu on 10/16/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "TXMeFooter.h"
#import "TXHTTPSessionManager.h"
#import "TXMeSquare.h"
#import "TXMeSquareButton.h"
#import <MJExtension.h>
#import <UIButton+WebCache.h>
@implementation TXMeFooter

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // request params
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        
        params[@"a"] = @"square";
        params[@"c"] = @"topic";
        
        // send request
        __weak typeof(self) weakSelf = self;
        
        [[TXHTTPSessionManager manager] GET:TXRequestURL parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
            // Dictionary array to Model array
            NSMutableArray *squares = [TXMeSquare objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
            [weakSelf createSquares:squares];
            TXWriteToPlist(responseObject, @"responseObject");
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            //
        }];
        
    }
    return self;
}
/**
 *  根据数据模型创建方块
 *
 *  @param squares 模型数据
 */
- (void)createSquares:(NSArray *)squares
{
    // assign columns
    NSInteger columns = 4;
    
    NSInteger count = squares.count;
    
    CGFloat buttonWidth = self.width / columns;
    CGFloat buttonHeight = buttonWidth;
    
    for (NSInteger i = 0; i < count; i++) {
        TXMeSquareButton *btn = [TXMeSquareButton buttonWithType:UIButtonTypeCustom];
        
        [self addSubview:btn];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.width = buttonWidth;
        btn.height = buttonHeight;
        
        btn.x = (i % columns) * buttonWidth;
        btn.y = (i / columns) * buttonHeight;
    
        
       // 设置数据
        btn.square = squares[i];

    }
    // 设置 tableFooterView 高度,有多种方式,还有可以通过公式,或通过计算(if 判断)
    self.height = self.subviews.lastObject.bottom;
    
    // 设置 tableFooterView 与底部贴合.当先设置 tableView.tableFooterView = self 然后再设置高度,会导致高度无效.
    // 所以在设置完高度之后必须再设置一次  tableView.tableFooterView = self
    UITableView *tableView = (UITableView *)self.superview;
    tableView.tableFooterView = self;
    
    // 还有一种做法
//    UITableView *tableView = (UITableView *)self.superview;
//    tableView.contentSize = CGSizeMake(0, self.bottom);
}


- (void)btnClick:(TXMeSquareButton *) btn
{
    TXLogFunc;
    NSString *url = btn.square.url;
    
    if ([url hasPrefix:@"mod://"]) {
        if ([url hasSuffix:@"BDJ_To_Check"]) {
            TXLog(@"跳转到BDJ_To_Check控制器");
        } else if ([url hasSuffix:@"App_To_SearchUser"]){
            TXLog(@"跳转到App_To_SearchUser");
        }
    } else if ([url hasPrefix:@"http://"]){
        // 获得当前导航控制器
        UITabBarController *root = (UITabBarController *)self.window.rootViewController;
        UINavigationController *nav = root.selectedViewController;
        
    }
}

@end
