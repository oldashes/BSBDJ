//
//  TXPictureViewController.m
//  BSBDJ
//
//  Created by TimXu on 10/28/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "TXPictureViewController.h"

@interface TXPictureViewController ()

@end

@implementation TXPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TXLogFunc;
    self.tableView.contentInset = UIEdgeInsetsMake(TXNavBarBottom + TXTitlesViewH, 0, TXTabBarH, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
}

#pragma mark - data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.backgroundColor = TXRandomColor;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ --- %zd", self.title, indexPath.row];
    return cell;
}

@end
