//
//  BaseViewController.m
//  LanOuPlan
//
//  Created by zzc-user1 on 2018/8/20.
//  Copyright © 2018年 lzy. All rights reserved.
//

#import "BaseViewController.h"

#import "NoteViewController.h"
#import "CalendarViewController.h"


@interface BaseViewController ()<UINavigationControllerDelegate>

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

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
}

#pragma mark 子类的数据
- (void)setUpNavigationbar{
    
}

- (void)setUpUI{
    
}

- (void)setUpData{
    
}

-(NavigationAnimation *)animation{
    if (!_animation) {
        _animation = [NavigationAnimation new];
    }
    return _animation;
}


#pragma mark 自定义转场动画


- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
 
        
    
    
    self.animation.operation = operation;
  


    return self.animation;
}












@end
