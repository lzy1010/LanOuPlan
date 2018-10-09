//
//  LyActionViewController.h
//  LanOuPlan
//
//  Created by zzc-13 on 2018/10/7.
//  Copyright © 2018年 lzy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LyActionViewController : UIViewController

/**
 默认为50%透明度
 */
@property (nonatomic, assign) CGFloat bgAlpha;

/**
 是否允许点击背景使弹窗消失
 */
@property (assign, nonatomic) BOOL allowBgActionHide;

- (void)showAnimation:(BOOL)animation viewController:(UIViewController *)vc;

- (void)hideAnimation:(BOOL)animation;

@end


/**
 window弹窗
 */
@interface LyActionWindow : LyActionViewController

- (void)showAnimation:(BOOL)animation;

+ (UIViewController *)topViewController;

@end

@interface LyActionDisplayWindow : UIWindow

+ (instancetype)share;

@end


NS_ASSUME_NONNULL_END
