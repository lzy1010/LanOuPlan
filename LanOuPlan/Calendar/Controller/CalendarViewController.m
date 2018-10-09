//
//  CalendarViewController.m
//  LanOuPlan
//
//  Created by monda on 2018/9/30.
//  Copyright © 2018 lzy. All rights reserved.
//

#import "CalendarViewController.h"
#import "NavigationAnimation.h"
#import "GalenPayPasswordView.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController

#pragma mark - Life Cycle


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    self.title = @"我是日历";
   
}

- (void)setUpUI{
    
}

- (void)setUpData{
    
}

#pragma mark - Event
#pragma mark - Private Methods
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    GalenPayPasswordView *pwdView = [GalenPayPasswordView tradeView];
    pwdView.Server.api = @"文亮大沙雕";
    [pwdView showInView:[UIApplication sharedApplication].keyWindow];
    
    __block typeof(GalenPayPasswordView *) blockPay = pwdView;
    [pwdView setFinish:^(NSString *pwdString) {
        
        [blockPay hiddenPayPasswordView];
    }];
    
    [pwdView setLessPassword:^{
        [blockPay hiddenPayPasswordView];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
        });
    }];
}

#pragma mark - Delegate
#pragma mark - Custom Delegate
#pragma mark - Getters and Setters








@end
