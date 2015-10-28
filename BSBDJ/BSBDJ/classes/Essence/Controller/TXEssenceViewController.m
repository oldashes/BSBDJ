//
//  TXEssenceViewController.m
//  BSBDJ
//
//  Created by TimXu on 9/18/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "TXEssenceViewController.h"
#import "TXRecommendTagViewController.h"
#import "TXTitleButton.h"

@interface TXEssenceViewController ()
/** 选中的 button */
@property (nonatomic, weak) UIButton *selectedButton;
/** 标题指示器 */
@property (nonatomic, weak)  UIView *titleIndicateView;

@end

@implementation TXEssenceViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    // 设置导航栏
    [self setUpNav];
    
    // 设置scrollView
    [self setUpScrollView];
    
    // 设置标题栏
    [self setUpTitleView];

}

- (void)setUpNav
{
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self aciton:@selector(tagSubClick) image:@"MainTagSubIcon" highlightImage:@"MainTagSubIconClick"];
    
}

- (void)setUpScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.backgroundColor = TXRandomColor;
    [self.view addSubview:scrollView];
}

- (void)setUpTitleView
{
    NSArray *title = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    UIView *titileView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, 40)];
    [self.view addSubview:titileView];
    titileView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    
    CGFloat buttonW = titileView.width / 5;
    CGFloat buttonH = titileView.height;
    for (int i = 0; i < 5; i++) {
        
        TXTitleButton *titleButton = [[TXTitleButton alloc] init];
        [titleButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [titileView addSubview:titleButton];
        titleButton.frame = CGRectMake(i * buttonW , 0, buttonW, buttonH);
        
        [titleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        titleButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [titleButton setTitle:title[i] forState:UIControlStateNormal];
    }
    
    // 添加指示器
    UIView *titleIndicateView = [[UIView alloc] init];
    [titileView addSubview:titleIndicateView];
    
    // 设置指示器的位置和颜色
    TXTitleButton *selectedButton = titileView.subviews.firstObject;
    titleIndicateView.backgroundColor = [selectedButton titleColorForState:UIControlStateSelected];
    titleIndicateView.height = 1;
    titleIndicateView.bottom = titileView.height;
    self.titleIndicateView = titleIndicateView;
    
    [selectedButton.titleLabel sizeToFit]; // 是否每次选择一个 button 都要 sizeToFit ？似乎不需要，viewDidLoad 之后文字位置确定了，但是并没有计算宽度，所以要 sizeToFit 来计算一下。这样就有宽度了，然后才能给指示器的宽度给值。
    
    selectedButton.selected = YES;
    self.selectedButton = selectedButton;
    
    titleIndicateView.width = selectedButton.titleLabel.width;
    titleIndicateView.centerX = selectedButton.centerX;
    
}

#pragma mark - 监听

- (void)tagSubClick
{
    TXLogFunc;
    
    TXRecommendTagViewController *tag = [[TXRecommendTagViewController alloc] init];
    [self.navigationController pushViewController:tag animated:YES];
}

- (void)buttonClick: (UIButton *)button
{
    TXLogFunc;
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    
    // 让指示器移动
    [UIView animateWithDuration:0.25 animations:^{
        self.titleIndicateView.width = button.titleLabel.width;
        self.titleIndicateView.centerX = button.centerX;
    }];
}

@end
