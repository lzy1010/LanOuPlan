//
//  NavigationAnimation.h
//  LanOuPlan
//
//  Created by monda on 2018/9/30.
//  Copyright © 2018 lzy. All rights reserved.
//

typedef enum : NSUInteger {
    NavigationRight,
    NavigationLeft,
    Navigationup,
    NavigationDown,
    
} NavigationAnimationType;



#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NavigationAnimation : NSObject<UIViewControllerAnimatedTransitioning>


@property(assign,nonatomic)NavigationAnimationType NavianimationType;

@property(assign,nonatomic)UINavigationControllerOperation operation;


@end

NS_ASSUME_NONNULL_END
