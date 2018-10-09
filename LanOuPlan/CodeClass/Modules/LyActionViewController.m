//
//  LyActionViewController.m
//  LanOuPlan
//
//  Created by zzc-13 on 2018/10/7.
//  Copyright © 2018年 lzy. All rights reserved.
//

#import "LyActionViewController.h"

@interface LyActionViewController ()

@property (strong, nonatomic) UIControl *bgControl;

@end

@implementation LyActionViewController

- (id)init{
    if (self = [super init]){
        _bgAlpha = -1;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bgControl = ({
        UIControl *bgC = [[UIControl alloc] initWithFrame:self.view.bounds];
        bgC.backgroundColor = [UIColor blackColor];
        [bgC addTarget:self action:@selector(bgControlAction) forControlEvents:UIControlEventTouchUpInside];
        bgC.alpha = 0;
        
        bgC;
    });
    
    [self.view addSubview:self.bgControl];
}

- (void)showAnimation:(BOOL)animation viewController:(UIViewController *)vc{
    [vc addChildViewController:self];
    [vc.view addSubview:self.view];
    
    NSTimeInterval duration = animation ? 0.2 : 0;
    
    [UIView animateWithDuration:duration animations:^{
        self.bgControl.alpha = self.bgAlpha > 0 ? self.bgAlpha : 0.5;
    } completion:nil];
}

- (void)hideAnimation:(BOOL)animation{
    NSTimeInterval duration = animation ? 0.2 : 0;
    
    [UIView animateWithDuration:duration animations:^{
        [self removeFromParentViewController];
        [self.view removeFromSuperview];
    }];
}

- (void)bgControlAction{
    if (self.allowBgActionHide) {
        [self hideAnimation:true];
    }
}


@end


@implementation LyActionWindow

- (void)showAnimation:(BOOL)animation{
    [LyActionDisplayWindow share].hidden = NO;
    UIViewController *rootVC = [LyActionDisplayWindow share].rootViewController;
    
    if (!rootVC) {
        rootVC = [[UIViewController alloc] init];
        [LyActionDisplayWindow share].rootViewController = rootVC;
    }
    
    [self showAnimation:true viewController:rootVC];
}

- (void)hideAnimation:(BOOL)animation{
    [LyActionWindow hideAnimation:animation];
}

+ (void)hideAnimation:(BOOL)animation
{
    LyActionWindow *vc = (LyActionWindow *)[[self class] topViewController];
    if (!vc) {
        return;
    }
    
    NSTimeInterval duration = animation ? 0.2 : 0;
    
    [UIView animateWithDuration:duration animations:^{
        vc.bgControl.alpha = 0;
    } completion:^(BOOL finished) {
        
        if ([LyActionDisplayWindow share].rootViewController.childViewControllers.count == 1)
        {
            [LyActionDisplayWindow share].rootViewController = nil;
            [LyActionDisplayWindow share].hidden = YES;
        }else
        {
            [vc removeFromParentViewController];
            [vc.view removeFromSuperview];
        }
    }];
}

+ (UIViewController *)topViewController
{
    return [LyActionDisplayWindow share].rootViewController.childViewControllers.lastObject;
}

- (void)bgControlAction{
    if (self.allowBgActionHide) {
        [[self class] hideAnimation:true];
    }
}


@end

@implementation LyActionDisplayWindow

+ (instancetype)share
{
    static LyActionDisplayWindow *obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[LyActionDisplayWindow alloc] init];
    });
    return obj;
}

- (id)init
{
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor clearColor];
        self.windowLevel = UIWindowLevelAlert + 100;
        self.hidden = NO;
    }
    return self;
}

@end
