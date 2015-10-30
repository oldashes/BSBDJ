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
#import "TXAllViewController.h"
#import "TXVideoViewController.h"
#import "TXVoiceViewController.h"
#import "TXWordViewController.h"
#import "TXPictureViewController.h"

@interface TXEssenceViewController () <UIScrollViewDelegate>
/** 选中的 button */
@property (nonatomic, weak) UIButton *selectedButton;
/** 标题指示器 */
@property (nonatomic, weak)  UIView *titleIndicateView;
/** 存放子控制器的 scrollview */
@property (nonatomic, weak) UIScrollView *scrollView;
/** 存放 titleView 中的 button 
 一般情况下，UI 控件会使用 weak 因为通常 UI 控件会被控制器引用，而普通的数据，会用 strong 保证需要时引用。
 */
@property (nonatomic, strong) NSMutableArray *titleButtons;
@end

@implementation TXEssenceViewController
/**
 *  懒加载 titleButtons
 */
- (NSMutableArray *)titleButtons{
    if (!_titleButtons) {
        _titleButtons = [NSMutableArray array];
    }
    return _titleButtons;
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    // 设置子控制器
    [self setupChildController];
    
    // 设置导航栏
    [self setupNav];
    
    // 设置scrollView
    [self setupScrollView];
    
    // 设置标题栏
    [self setupTitleView];
    
    // 设置自控器视图（根据 scrollView 的偏移量添加子控制器视图）
    [self addChildVcView];

}

- (void)setupChildController
{
    TXAllViewController *allVC = [[TXAllViewController alloc] init];
    [self addChildViewController:allVC];
    allVC.title = @"全部";
    
    TXVideoViewController *videoVC = [[TXVideoViewController alloc] init];
    [self addChildViewController:videoVC];
    videoVC.title = @"视频";
    
    TXVoiceViewController *voiceVC = [[TXVoiceViewController alloc] init];
    [self addChildViewController:voiceVC];
    voiceVC.title = @"声音";
    
    TXPictureViewController *pictureVC = [[TXPictureViewController alloc] init];
    [self addChildViewController:pictureVC];
    pictureVC.title = @"图片";
    
    TXWordViewController *topicVC = [[TXWordViewController alloc] init];
    [self addChildViewController:topicVC];
    topicVC.title = @"段子";
}


- (void)setupNav
{
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self aciton:@selector(tagSubClick) image:@"MainTagSubIcon" highlightImage:@"MainTagSubIconClick"];
    
}

- (void)setupScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.backgroundColor = TXRandomColor;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    // 禁止系统自动内边距调整
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 设置内容大小
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count * scrollView.width, 0);

    // 这样一次性加载所有的子控制器视图，显然不好。所以要用懒加载的方式。
/*
 
    for (int i = 0; i < self.childViewControllers.count; i++) {
        UITableViewController *vc = self.childViewControllers[i];
        vc.tableView.contentInset = UIEdgeInsetsMake(104, 0, 49, 0);
        // 滚动条内边距
        vc.tableView.scrollIndicatorInsets = vc.tableView.contentInset;
        
        vc.tableView.x = i * scrollView.width;
        vc.tableView.y = 0;
        vc.tableView.width = scrollView.width;
        vc.tableView.height = scrollView.height;
        [scrollView addSubview:vc.view];
    }
 */
    
}

- (void)setupTitleView
{
    
    UIView *titileView = [[UIView alloc] initWithFrame:CGRectMake(0, TXNavBarBottom, self.view.width, TXTitlesViewH)];
    [self.view addSubview:titileView];
    titileView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    
    CGFloat buttonW = titileView.width / 5;
    CGFloat buttonH = titileView.height;
    
    NSInteger childVcCount = self.childViewControllers.count;
    
    for (int i = 0; i < childVcCount; i++) {
        
        TXTitleButton *titleButton = [[TXTitleButton alloc] init];
        titleButton.tag = i;
        [titleButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [titileView addSubview:titleButton];
        [self.titleButtons addObject:titleButton];
        
        titleButton.frame = CGRectMake(i * buttonW , 0, buttonW, buttonH);
        
        [titleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        titleButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [titleButton setTitle:self.childViewControllers[i].title forState:UIControlStateNormal];
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
    
    TXRecommendTagViewController *tag = [[TXRecommendTagViewController alloc] init];
    [self.navigationController pushViewController:tag animated:YES];
}

- (void)buttonClick: (UIButton *)button
{
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    
    // 让指示器移动
    [UIView animateWithDuration:0.25 animations:^{
        self.titleIndicateView.width = button.titleLabel.width;
        self.titleIndicateView.centerX = button.centerX;
    }];
    
    // 点击 button 让 scroll 滚动
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = button.tag * self.scrollView.width;
//    self.scrollView.contentOffset = offset;
    [self.scrollView setContentOffset:offset animated:YES];
}

#pragma mark <UIScrollViewDelegate>
/**
 *  scrollView 停止减速时会调用这个方法，手势拖拽导致的停止滚动才会触发。
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    UIButton *btn = self.titleButtons[index];
    [self buttonClick:btn];
    [self addChildVcView];
}

/**
 *  scrolllView 停止滚动时会调用这个方法，但是尽在使用 setContentOffset:offset animated:YES 方法(滚动动画)时才触发。
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self addChildVcView];
}

#pragma mark - 其他方法

- (void)addChildVcView
{
    // 搞个索引出来，方便获得子控制器。
    NSInteger index = self.scrollView.contentOffset.x / self.scrollView.width;
    UITableViewController *viewController = self.childViewControllers[index];
    
    // 如果它的控制器已经载入了，就不再做添加操作了
    if (viewController.isViewLoaded) return;
    [self.scrollView addSubview:viewController.view];
/*
    // 这些写在各个子控制器里面比较好
    viewController.tableView.contentInset = UIEdgeInsetsMake(TXNavBarBottom + TXTitlesViewH, 0, TXTabBarH, 0);
    viewController.tableView.contentOffset = CGPointMake(0, -104); // 手动设置一个偏移量，如果是在 viewDidLoad 中就会自动设置偏移量等于内边距（我猜的），所以这里要手动设一下，否则页面第一次加载时需要下拉一下才能达到内边距效果。
 */
    viewController.tableView.frame = self.scrollView.bounds;
}
@end
