//
//  BaseViewController.h
//  LanOuPlan
//
//  Created by zzc-user1 on 2018/8/20.
//  Copyright © 2018年 lzy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationAnimation.h"

@interface BaseViewController : UIViewController

@property(assign,nonatomic)NavigationAnimationType animationType;
@property(strong,nonatomic)NavigationAnimation *animation;



//-(NavigationAnimation*)getAnimation;

/**
 子类设置导航条
 */
- (void)setUpNavigationbar;

/**
 子类设置基本UI
 */
- (void)setUpUI;


/**
 子类设置数据
 */
- (void)setUpData;






@end
