//
//  ViewController.m
//  LanOuPlan
//
//  Created by zzc-13 on 2018/7/31.
//  Copyright © 2018年 lzy. All rights reserved.
//

#import "ViewController.h"
#import "Student+CoreDataClass.h"
#import "CoreDataManager.h"

@interface ViewController ()

@property (strong, nonatomic) CoreDataManager *coreDataManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.coreDataManager = ({
        CoreDataManager *manager = [[CoreDataManager alloc] init];
        [manager createSqlite:@"Model" error:nil];
        
        manager;
    });
    
//    [self.coreDataManager addData:@"Student" model:^(NSObject *model) {
//        if ([model isKindOfClass:[Student class]]) {
//            Student *lzy = (Student *)model;
//            lzy.name = @"fnd";
//            lzy.age = 10;
//        }
//    } error:^(NSString *error) {
//        NSLog(@"%@",error);
//    }];
    
    [self.coreDataManager deleteData:@"Student" predicate:nil error:nil];
    
    NSLog(@"%@",[self.coreDataManager readData:@"Student" predicate:nil error:nil]);
}




@end
