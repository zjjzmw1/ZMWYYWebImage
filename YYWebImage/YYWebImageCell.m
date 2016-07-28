//
//  YYWebImageCell.m
//  YYWebImage
//
//  Created by speedx on 16/7/28.
//  Copyright © 2016年 speedx. All rights reserved.
//

#import "YYWebImageCell.h"
#import "YYWebImage.h"

@interface YYWebImageCell()

@property (strong, nonatomic) UILabel       *nameLabel;
@property (strong, nonatomic) UIImageView   *iconImageView;

@end

@implementation YYWebImageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andType:(NSString *)type
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        

        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        self.iconImageView.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:self.iconImageView];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

+ (id)imageCellWithReuseIdentifier:(NSString *)reuseIdentifier andType:(NSString *)type
{
    return [[YYWebImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier andType:type];
}

#pragma mark - 自定义的cell赋值方法.
- (void)drawCellWithString:(NSString *)string row:(NSInteger)row count:(NSInteger)count {
    NSURL *url = [NSURL URLWithString:string];
    if (row == 0) {//正常的
        [self.iconImageView yy_setImageWithURL:url placeholder:[UIImage imageNamed:@"Default_image"]];
    }else if (row == 1) {//渐进式的
        [self.iconImageView yy_setImageWithURL:url placeholder:[UIImage imageNamed:@"Default_image"] options:YYWebImageOptionProgressive completion:nil ];

    }else if (row == 2) {
        [self.iconImageView yy_setImageWithURL:url placeholder:[UIImage imageNamed:@"Default_image"] options:YYWebImageOptionProgressiveBlur|YYWebImageOptionSetImageWithFadeAnimation completion:nil ];
        
    }else if (row == 3) {
        [self.iconImageView yy_setImageWithURL:url placeholder:[UIImage imageNamed:@"Default_image"] options:YYWebImageOptionSetImageWithFadeAnimation completion:nil ];
        
    }else{
        [self.iconImageView yy_setImageWithURL:url placeholder:[UIImage imageNamed:@"Default_image"] options:YYWebImageOptionProgressiveBlur completion:nil ];

    }
    
}

@end
