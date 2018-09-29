//
//  BaseViewController.m
//  LanOuPlan
//
//  Created by zzc-user1 on 2018/8/20.
//  Copyright © 2018年 lzy. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self superConfig];
    [self setUpUI];
    [self setUpNavigationbar];
    [self setUpData];
}

#pragma mark - 父类的数据

- (void)superConfig{
    
}



#pragma mark 子类的数据
- (void)setUpNavigationbar{
    
}

- (void)setUpUI{
    
}

- (void)setUpData{
    
}


@end
