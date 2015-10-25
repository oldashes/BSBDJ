//
//  TXSettingViewController.m
//  BSBDJ
//
//  Created by TimXu on 9/26/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "TXSettingViewController.h"
#import <SDImageCache.h>

#import "TXClearCacheCell.h"
#import "TXSettingCell.h"
#import "TXOtherCell.h"

@interface TXSettingViewController ()

@end

@implementation TXSettingViewController

static NSString * const TXClearCacheCellID = @"clear_cache";
static NSString * const TXSettingCellID = @"setting";
static NSString * const TXOtherCellID = @"other";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    
    // 获取文件夹大小
    [self getCacheSize];
    
    // 注册三个不同的 cell
    [self.tableView registerClass:[TXClearCacheCell class] forCellReuseIdentifier:TXClearCacheCellID];
    [self.tableView registerClass:[TXSettingCell class] forCellReuseIdentifier:TXSettingCellID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TXOtherCell class]) bundle:nil] forCellReuseIdentifier:TXOtherCellID];
    
/*
    NSFileManager的作用:创建\删除\剪切\复制粘贴文件, 获得文件属性等文件相关的操作
    TXLog(@"%@ %zd", NSTemporaryDirectory(), [SDImageCache sharedImageCache].getSize);
*/
 }

/**
 *  获得共享对象的常见方法
 *  [类名 sharedXXXX] 比如[UIApplication sharedApplication]
 *  [类名 currentXXXX] 比如[NSCalendar currentCalendar], [UIDevice currentDevice]
 *  [类名 defaultXXXX] 比如[NSFileManager defaultManager], [NSNotificationCenter defaultCenter]
 *  [类名 standardXXXX] 比如[NSUserDefaults standardUserDefaults]
 */
/*
    抽取分类的思考,选择最合适最便捷的一种
    NSInteger fileSize = [NSFileManager fileSize:@"/fgdgfd/gdfgdfg/gdfgdfg"];
    NSInteger fileSize = [NSString fileSize:@"/gdfgfdg/gdfgdfg"];
    NSInteger fileSize = [@"/gdfgfdg/gdfgdfg" fileSize];
 */
- (void)getCacheSize
{
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSString *directory = [cachePath stringByAppendingPathComponent:@"default"];
    NSInteger fileSize = 0;
    fileSize = [directory fileSize];
    
    TXLog(@"%zd", fileSize);
}

- (void)getCacheSize3
{
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSString *directory = [cachePath stringByAppendingPathComponent:@"default"];
    
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    NSInteger fileSize = 0;
    
    NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:directory];
    for (NSString* subpath in enumerator) {
        NSString *fullPath = [directory stringByAppendingPathComponent:subpath];
        fileSize += [mgr attributesOfItemAtPath:fullPath error:nil].fileSize;
    }
    
    TXLog(@"%zd", fileSize);
    
}

- (void)getCacheSize2
{
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSString *directory = [cachePath stringByAppendingPathComponent:@"default"];
    
    // 总文件大小,初始值最好设为0
    NSInteger fileSize = 0;
    
    // 遍历文件夹
    NSFileManager *mgr = [NSFileManager defaultManager];
//    TXLog(@"%@", [mgr contentsOfDirectoryAtPath:directory error:nil]);  // 此方法只会查找路径下的目录和文件
//    TXLog(@"%@", [mgr subpathsAtPath:directory]); // 此方法会递归查找路径下的目录和文件
    NSArray *subpaths = [mgr subpathsAtPath:directory];
    for (NSString *subpath in subpaths) {
        NSString *filepath = [directory stringByAppendingPathComponent:subpath]; // 补全路径
        fileSize += [mgr attributesOfItemAtPath:filepath error:nil].fileSize;
    }
    
    TXLog(@"%zd", fileSize);
}

- (void)getCacheSize1
{
//    获得Library/Caches文件夹
//    NSArray<NSString *> *NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
//  这个方法可以找到很多路径哟 😄 注意返回值是数组,但是只有一个元素 firstobject
    
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSString *directory = [cachesPath stringByAppendingPathComponent:@"default"]; // 拼接上 "/default"
    
    NSFileManager *mgr = [NSFileManager defaultManager];
    NSDictionary *attrs = [mgr attributesOfItemAtPath:directory error:nil]; // 获得文件夹的一系列属性,用字典存起来(很熟悉的一种方式)
    
    // 这种方式只能获取到文件夹的大小(文件夹本身),而不能获得整个文件夹的大小
    TXLog(@"%zd", [attrs[NSFileSize] integerValue]);
    TXLog(@"%zd", attrs.fileSize); //与上面一样,不过这是字典本身提供的方法
    TXLog(@"%@", cachesPath);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 15;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

// 手动创建并指定 cell
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    }
//    
//    cell.textLabel.text = @"清除缓存(2.5GB)";
//    
//    return cell;
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return [tableView dequeueReusableCellWithIdentifier:TXClearCacheCellID];
        } else {
            TXSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:TXSettingCellID];
            
            if (indexPath.row == 1) {
                cell.textLabel.text = @"检查更新";
            } else if (indexPath.row == 2) {
                cell.textLabel.text = @"给我评分";
            } else if (indexPath.row == 3) {
                cell.textLabel.text = @"推送设置";
            } else {
                cell.textLabel.text = @"关于我们";
            }
                
            return cell;
        }
    } else {
        return [tableView dequeueReusableCellWithIdentifier:TXOtherCellID];
    }
}

#pragma mark - delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TXLogFunc;
}

@end
