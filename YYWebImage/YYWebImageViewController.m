//
//  YYWebImageViewController.m
//  YYWebImage
//
//  Created by speedx on 16/7/28.
//  Copyright © 2016年 speedx. All rights reserved.
//

#import "YYWebImageViewController.h"
#import "YYWebImageCell.h"
#import "YYWebImage.h"

@interface YYWebImageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView       *tableView;
@property (strong, nonatomic) NSMutableArray    *dataArray;

@end

@implementation YYWebImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化数据
    [self initDataArray];
    // 初始化表格
    [self initTableView];

}

/// 初始化数据
-(void)initDataArray {
    self.dataArray = [NSMutableArray array];
    [self.dataArray addObject:@"http://a.hiphotos.baidu.com/zhidao/pic/item/72f082025aafa40fa38bfc55a964034f79f019ec.jpg"];
    [self.dataArray addObject:@"http://a.hiphotos.baidu.com/zhidao/pic/item/72f082025aafa40fa38bfc55a964034f79f019ec.jpg"];
    [self.dataArray addObject:@"http://a.hiphotos.baidu.com/zhidao/pic/item/72f082025aafa40fa38bfc55a964034f79f019ec.jpg"];
    [self.dataArray addObject:@"http://a.hiphotos.baidu.com/zhidao/pic/item/72f082025aafa40fa38bfc55a964034f79f019ec.jpg"];
    [self.dataArray addObject:@"http://a.hiphotos.baidu.com/zhidao/pic/item/72f082025aafa40fa38bfc55a964034f79f019ec.jpg"];
    [self.dataArray addObject:@"http://a.hiphotos.baidu.com/zhidao/pic/item/72f082025aafa40fa38bfc55a964034f79f019ec.jpg"];
}

/// 初始化表格
-(void)initTableView {
    // UITableViewStyleGrouped 的话，表格上下都有一个满格的横线。UITableViewStylePlain 没有。
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    /// 但是设置成 UITableViewStyleGrouped 后，表格上面有留白，可以通过 设置 heightForHeaderInSection 高度来 去掉留白.
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    // 中间线的颜色、样式
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorColor = [UIColor lightGrayColor];
    // 中间线的位置
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 0);
    // 内容少于一屏的时候，去掉多余的中间的线。
    UIView *footerV = [[UIView alloc]initWithFrame:CGRectZero];
    [self.tableView setTableFooterView:footerV];
}

#pragma mark - Table view data source
/// 可以去掉 表格设置 UITableViewStyleGrouped 后 默认的 上面的留白
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0001;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"YYWebImageCell";
    YYWebImageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell){
        cell = [YYWebImageCell imageCellWithReuseIdentifier:CellIdentifier andType:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    [cell drawCellWithString:[self.dataArray objectAtIndex:indexPath.row] row:indexPath.row count:self.dataArray.count];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == self.dataArray.count - 1) {
        YYImageCache *cache = [YYWebImageManager sharedManager].cache;
        
        // clear cache
        [cache.memoryCache removeAllObjects];
        [cache.diskCache removeAllObjects];
        
        // clear disk cache with progress
        [cache.diskCache removeAllObjectsWithProgressBlock:^(int removedCount, int totalCount) {
            // progress
        } endBlock:^(BOOL error) {
            // end
            NSLog(@"清除缓存OK");
        }];
        
    }
    
}

@end
