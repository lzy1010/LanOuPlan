//
//  HomeViewController.m
//  LanOuPlan
//
//  Created by monda on 2018/9/30.
//  Copyright © 2018 lzy. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property(nonatomic,strong)UIScrollView *scrollView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setUpUI{
    self.scrollView =   ({
        UIScrollView *name = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        [name setContentSize:CGSizeMake(3 * kScreenW, 3 * kScreenH)];
        [name setContentOffset:CGPointMake(kScreenW, kScreenH)];
        name.pagingEnabled = YES;
        name.backgroundColor = [UIColor redColor];
        [self.view addSubview:name];
        name;
    });
    
    
    
}


@end
