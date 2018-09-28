//
//  TodayViewController.m
//  todayExtension
//
//  Created by monda on 2018/9/19.
//  Copyright © 2018年 lzy. All rights reserved.
//


#define buttonW 50
#define kScreenW [UIScreen mainScreen].bounds.size.width

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>
@property(strong,nonatomic)UIButton *button1;
@property(strong,nonatomic)UIButton *button2;
@property(strong,nonatomic)UIButton *button3;
@property(strong,nonatomic)UIButton *button4;
@property(strong,nonatomic)UIStackView *stackView;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBottom];

    
}



- (void)addBottom{
    UIStackView *stackView = [[UIStackView alloc]initWithFrame:CGRectMake(10, 0, kScreenW - 40, 50)];
        stackView.contentMode = UIViewContentModeCenter;
    stackView.distribution = UIStackViewDistributionEqualCentering;
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.spacing = 5;
   
    [self.view addSubview:stackView];
    self.stackView = stackView;
    
    self.button1 =  ({
        UIButton *name = [UIButton new];
        [name addTarget:self action:@selector(skip:) forControlEvents:UIControlEventTouchUpInside];
        name.backgroundColor = [UIColor cyanColor];
        name.frame = CGRectMake(0, 0, buttonW, buttonW);
        [self.stackView addArrangedSubview:name];
        name;
    });
    
    self.button2 =  ({
        UIButton *name = [UIButton new];
         [name addTarget:self action:@selector(skip:) forControlEvents:UIControlEventTouchUpInside];
        name.frame = CGRectMake(0, 0, buttonW, buttonW);
         name.backgroundColor = [UIColor blueColor];
       [self.stackView addArrangedSubview:name];
        name;
    });
    
    self.button3 =  ({
        UIButton *name = [UIButton new];
         [name addTarget:self action:@selector(skip:) forControlEvents:UIControlEventTouchUpInside];
        name.frame = CGRectMake(0, 0, buttonW, buttonW);
          name.backgroundColor = [UIColor redColor];
        [self.stackView addArrangedSubview:name];
        name;
    });
    
    self.button4 =  ({
        UIButton *name = [UIButton new];
         [name addTarget:self action:@selector(skip:) forControlEvents:UIControlEventTouchUpInside];
          name.backgroundColor = [UIColor yellowColor];
        name.frame = CGRectMake(0, 0, buttonW, buttonW);
        [self.stackView addArrangedSubview:name];
        name;
    });
}
- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}
//跳转的方法
- (void)skip:(UIButton *)button
{
    if ([button isEqual:self.button1]) {
        [self.extensionContext openURL:[NSURL URLWithString:@"iOSWidgetApp://action=GotoHomePage"] completionHandler:nil];
    }else{
        [self.extensionContext openURL:[NSURL URLWithString:@"iOSWidgetApp://action=GoBack"] completionHandler:nil];
    }
    
    
}



//缩进
//- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets{
//    　　　return UIEdgeInsetsZero;
//}
@end
