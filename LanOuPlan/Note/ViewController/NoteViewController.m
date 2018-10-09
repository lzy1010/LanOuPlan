//
//  NoteViewController.m
//  LanOuPlan
//
//  Created by monda on 2018/9/30.
//  Copyright © 2018 lzy. All rights reserved.
//

#import "NoteViewController.h"
#import "NavigationAnimation.h"
#import "GalenPayPasswordView.h"
@interface NoteViewController ()

@end

@implementation NoteViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"我是笔记本";
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    GalenPayPasswordView *pwdView = [GalenPayPasswordView tradeView];
    pwdView.Server.api = @"楠英大沙雕";
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




@end
