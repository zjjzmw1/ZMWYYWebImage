//
//  ViewController.h
//  YYWebImage
//
//  Created by speedx on 16/7/28.
//  Copyright © 2016年 speedx. All rights reserved.
//


/*
 
 YYWebImage 调研结果：
 
 详细地址：https://github.com/ibireme/YYWebImage
 YYWebImage 设计的目的就是为了替代SDWebImage 等一些图片加载框架，在内存、性能上做了优化。
 
 功能类似 SDWebImage  所以基础的功能都不用说了。列一些不同的。
 
 YYWebImage: 能处理图片圆角、模糊、大小调整、旋转等功能(并且圆角的方式不是系统自带的，而是画的方式，不会影响性能)；
 渐进式加载、逐行加载、隔行加载；
 内存、磁盘缓存、图片设置方式 都比 SDWebImage 性能高。
 
 常用用法：
 // 加载网络图片
 imageView.yy_imageURL = [NSURL URLWithString:@“”];
 // 加载本地图片
 imageView.yy_imageURL = [NSURL fileURLWithPath:@“”];
 加载动态图片的时候，用法一样。只需要把 UIImageView 替换为 YYAnimatedImageView 就可以了。
 
 // 渐进式图片加载
 [imageView yy_setImageWithURL:url options:YYWebImageOptionProgressive];
 // 增加模糊效果和渐变动画
 把options 参数值 改为：YYWebImageOptionProgressiveBlur ｜ YYWebImageOptionSetImageWithFadeAnimation
 
 // 取消图片下载
 
 - (void)yy_cancelCurrentImageRequest;
 
 // 预先下载并存储
 
 [[YYWebImageManager sharedManager]requestImageWithURL:[NSURL URLWithString:@"http://zhangmingwei.qiniudn.com/gglogo.jpg"] options:YYWebImageOptionAllowBackgroundTask progress:nil transform:nil completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
 
 NSLog(@"image === %@,url====%@",image,url.absoluteString);
 
 [[YYImageCache sharedCache]setImage:image forKey:url.absoluteString];
 
 }];
 
 - (void)yy_setImageWithURL:(nullable NSURL *)imageURL placeholder:(nullable UIImage *)placeholder;
 
 - (void)yy_setImageWithURL:(nullable NSURL *)imageURL options:(YYWebImageOptions)options;
 
 - (void)yy_setImageWithURL:(nullable NSURL *)imageURL
 
 placeholder:(nullable UIImage *)placeholder
 
 options:(YYWebImageOptions)options
 
 completion:(nullable YYWebImageCompletionBlock)completion;
 
 - (void)yy_setImageWithURL:(nullable NSURL *)imageURL
 
 placeholder:(nullable UIImage *)placeholder
 
 options:(YYWebImageOptions)options
 
 progress:(nullable YYWebImageProgressBlock)progress
 
 transform:(nullable YYWebImageTransformBlock)transform
 
 completion:(nullable YYWebImageCompletionBlock)completion;
 
 
 */














#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@end

