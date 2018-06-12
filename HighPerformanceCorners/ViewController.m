//
//  ViewController.m
//  HighPerformanceCorners
//
//  Created by 雷源 on 2018/6/12.
//  Copyright © 2018年 Yuanjihua. All rights reserved.
//

#import "ViewController.h"
#import "LYCircleImageView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    LYCircleImageView * circleView = [[LYCircleImageView alloc]init];
    circleView.frame = CGRectMake(100, 100, 100, 100);
    circleView.image = [UIImage imageNamed:@"favicon"];
    [circleView addCorners:50];
    [self.view addSubview:circleView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
