//
//  TXLoginRegisteViewController.m
//  BSBDJ
//
//  Created by TimXu on 10/2/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "TXLoginRegisteViewController.h"

@interface TXLoginRegisteViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMargin;

@end

@implementation TXLoginRegisteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}



- (IBAction)loginOrRegister:(UIButton *)button {
    
    button.selected = !button.isSelected;
    
    if (self.leftMargin.constant) {
        self.leftMargin.constant = 0;
    } else{
        self.leftMargin.constant = - self.view.width;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
    
    [self.view endEditing:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
