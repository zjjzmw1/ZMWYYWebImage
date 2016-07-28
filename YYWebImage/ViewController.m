//
//  ViewController.m
//  YYWebImage
//
//  Created by speedx on 16/7/28.
//  Copyright © 2016年 speedx. All rights reserved.
//

#import "ViewController.h"
#import "YYWebImageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    YYWebImageViewController *vc = [[YYWebImageViewController alloc]init];
    [self.navigationController pushViewController:vc  animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
