//
//  TXWebViewController.m
//  BSBDJ
//
//  Created by TimXu on 10/20/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "TXWebViewController.h"

@interface TXWebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardItem;

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation TXWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    这个属性影响自动调整内边距,它影响的控件包括: UIScrollView \ UITableView \ UITextView \ UIWebView
}

- (IBAction)back
{
    [self.webView goBack];
}

- (IBAction)forward
{
    [self.webView goForward];
}

- (IBAction)reload
{
    [self.webView reload];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - <UIWebViewDelegate>

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.backItem.enabled = webView.canGoBack;
    self.forwardItem.enabled = webView.canGoForward;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
