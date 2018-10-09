//
//  NavigationAnimation.m
//  LanOuPlan
//
//  Created by monda on 2018/9/30.
//  Copyright © 2018 lzy. All rights reserved.
//

#import "NavigationAnimation.h"

@implementation NavigationAnimation




// 定义转场动画的时间
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.5;
}

// 定义转场动画的行为
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    NSLog(@"自定义转场");
    NSLog(@"%ld",self.NavianimationType);
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //to
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView* toView = nil;
    UIView* fromView = nil;
    //UITransitionContextFromViewKey和UITransitionContextToViewKey定义在iOS8.0以后的SDK中，所以在iOS8.0以下SDK中将toViewController和fromViewController的view设置给toView和fromView
    //iOS8.0 之前和之后view的层次结构发生变化，所以iOS8.0以后UITransitionContextFromViewKey获得view并不是fromViewController的view
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    } else {
        fromView = fromViewController.view;
        toView = toViewController.view;
    }
    //这个非常重要，将toView加入到containerView中
    [[transitionContext containerView]  addSubview:toView];
    
//        if (self.operation == UINavigationControllerOperationPush) {
            switch (self.NavianimationType) {
                case NavigationRight:
                    [self animationWithRight:transitionContext FromView:fromView toView:toView];
                    break;
                case NavigationLeft:
                    [self animationWithLeft:transitionContext FromView:fromView toView:toView];
                    break;
                    
                default:
                    break;
            }
//    }    
}

//自定义动画
- (void)customAnimation:(id <UIViewControllerContextTransitioning>)transitionContext FromView:(UIView *)fromView toView:(UIView *)toView{
    
    NSLog(@"自定义动画");
    
    
}


//右边进入动画
- (void)animationWithRight:(id <UIViewControllerContextTransitioning>)transitionContext FromView:(UIView *)fromView toView:(UIView *)toView{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    toView.frame = CGRectMake(width, 0, width, height);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toView.frame = CGRectMake(0, 0, width, height);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

//左边进入动画

- (void)animationWithLeft:(id <UIViewControllerContextTransitioning>)transitionContext FromView:(UIView *)fromView toView:(UIView *)toView{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    toView.frame = CGRectMake(-width, 0, width, height);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toView.frame = CGRectMake(0, 0, width, height);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}


@end
