//
//  ViewController.m
//  LanOuPlan
//
//  Created by zzc-13 on 2018/7/31.
//  Copyright © 2018年 lzy. All rights reserved.
//

#import "ViewController.h"
#import "LOCoreDataManager.h"
#import <Masonry/Masonry.h>
#import "UserInfo+CoreDataClass.h"

@interface ViewController ()

@property (strong, nonatomic) LOCoreDataManager *coreDataManager;

@property (strong, nonatomic) UIButton *testBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.coreDataManager = ({
        LOCoreDataManager *manager = [[LOCoreDataManager alloc] init];
        [manager createSqlite:@"Model" error:nil];
        
        manager;
    });
    
    self.testBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundColor:[UIColor redColor]];
        [btn addTarget:self action:@selector(addStudent) forControlEvents:UIControlEventTouchUpInside];
        
        btn;
    });
    
    [self.view addSubview:self.testBtn];
     
    [self.testBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(100);
        make.width.height.mas_equalTo(100);
     }];
    
    //失去了前台的监听
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(applicationWillResignActive) name:UIApplicationWillResignActiveNotification object:nil];
    
    
    
}

- (void)applicationWillResignActive{
    
}




- (void)addStudent{
    NSURL *url = [NSURL URLWithString:@"Prefs:root=WIFI"];
    
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        } else {
            [[UIApplication sharedApplication]openURL:url];
        }
    }
//    [self.coreDataManager addData:@"Student" model:^(NSObject *model) {
//        if ([model isKindOfClass:[Student class]]) {
//            Student *lzy = (Student *)model;
//            lzy.name = @"lzy";
//            lzy.age = 10;
//        }
//    } error:^(NSString *error) {
//        NSLog(@"%@",error);
//    }];
//
//    [self.coreDataManager deleteData:@"Student" predicate:nil error:nil];
//    NSArray<Student *> *arr = [self.coreDataManager readData:@"Student" predicate:[NSPredicate predicateWithFormat:[NSString stringWithFormat:@"name = 'lzy'"]] error:nil];
//
//    [arr enumerateObjectsUsingBlock:^(Student * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"%@",obj.name);
//    }];
}




@end
