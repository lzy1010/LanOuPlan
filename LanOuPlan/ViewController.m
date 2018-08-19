//
//  ViewController.m
//  LanOuPlan
//
//  Created by zzc-13 on 2018/7/31.
//  Copyright © 2018年 lzy. All rights reserved.
//

#import "ViewController.h"
//#import "CoreDataManager.h"
#import <Masonry/Masonry.h>
#import "UserInfo+CoreDataClass.h"

@interface ViewController ()

//@property (strong, nonatomic) CoreDataManager *coreDataManager;

@property (strong, nonatomic) UIButton *testBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.coreDataManager = ({
//        CoreDataManager *manager = [[CoreDataManager alloc] init];
//        [manager createSqlite:@"Model" error:nil];
//        
//        manager;
//    });
    
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
    
}

- (void)addStudent{
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
////    [self.coreDataManager deleteData:@"Student" predicate:nil error:nil];
//    NSArray<Student *> *arr = [self.coreDataManager readData:@"Student" predicate:[NSPredicate predicateWithFormat:[NSString stringWithFormat:@"name = 'lzy'"]] error:nil];
//
//    [arr enumerateObjectsUsingBlock:^(Student * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"%@",obj.name);
//    }];
}




@end
