//
//  TXClearCacheCell.m
//  BSBDJ
//
//  Created by TimXu on 10/21/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "TXClearCacheCell.h"
#import <SVProgressHUD.h>
#import <SDImageCache.h>

// 缓存路径
#define TXCacheFilePath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"default"]

@implementation TXClearCacheCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 初始化文字
        self.textLabel.text = @"清除缓存";
        // 禁止用户交互
        self.userInteractionEnabled = NO;
        // 右边圆圈
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [loadingView startAnimating];
        self.accessoryView = loadingView;
        
        // 在子线程计算缓存大小
        [[[NSOperationQueue alloc] init] addOperationWithBlock:^{
            // 单位
            double unit = 1000.0;
            // 缓存大小
            unsigned long long fileSize = [TXCacheFilePath fileSize];
            // 标签文字
            NSString *fileSizeText = nil;
            if (fileSize >= pow(unit, 3)) {
                fileSizeText = [NSString stringWithFormat:@"%.2fGB", fileSize / pow(unit, 3)];
            } else if (fileSize >= pow(unit, 2)) {
                fileSizeText = [NSString stringWithFormat:@"%.2fMB", fileSize / pow(unit, 2)];
            } else if (fileSize >= unit) {
                fileSizeText = [NSString stringWithFormat:@"%.2fKB", fileSize / unit];
            } else {
                fileSizeText = [NSString stringWithFormat:@"%zdB", fileSize];
            }
            
            NSString *text = [NSString stringWithFormat:@"清除缓存(%@)", fileSizeText];
            
            // 回到主线程
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                // 设置标签文字
                self.textLabel.text = text;
                
                // 去掉圈圈
                self.accessoryView = nil;
                self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                self.userInteractionEnabled = YES;
                
            }];
        }];
        
        // 给 cell 添加一个tap手势
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clearCaches)]];
    }
    
    return self;
}

/**
 *  清除缓存
 */
- (void)clearCaches
{
    if (self.accessoryView) return;
    [SVProgressHUD showWithStatus:@"clearing" maskType: SVProgressHUDMaskTypeBlack];
    
    // 子线程执行删除操作
    [[[NSOperationQueue alloc] init] addOperationWithBlock:^{
        // 删除缓存
        [[NSFileManager defaultManager] removeItemAtPath:TXCacheFilePath error:nil];
        
        // 回到主线程
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            // 隐藏 HUD
            [SVProgressHUD dismiss];
            // 修改文字
            self.textLabel.text = @"清除缓存(0B)";
            
        }];
    }];
}

/**
 * 1.当控件显示到屏幕上时会调用一次layoutSubviews
 * 2.当控件的尺寸发生改变的时候会调用一次layoutSubviews
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    // 当cell离开屏幕时, UIActivityIndicatorView的动画就会被自动停止
    // 当cell重新显示到屏幕上时, 应该重新开始UIActivityIndicatorView的动画
    
    // 转型问题?向上转型,向下转型?
    UIActivityIndicatorView *loadView = (UIActivityIndicatorView *)self.accessoryView;
    
    [loadView startAnimating];
}

@end
