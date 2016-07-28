//
//  YYWebImageCell.h
//  YYWebImage
//
//  Created by speedx on 16/7/28.
//  Copyright © 2016年 speedx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYWebImageCell : UITableViewCell

#pragma mark - 初始化的cell.
+ (id)imageCellWithReuseIdentifier:(NSString *)reuseIdentifier andType:(NSString *)type;

#pragma mark - 自定义的cell赋值方法.
- (void)drawCellWithString:(NSString *)string row:(NSInteger)row count:(NSInteger)count;


@end
