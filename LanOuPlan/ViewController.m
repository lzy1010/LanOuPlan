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
#import <MobileCoreServices/MobileCoreServices.h>

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
//    NSURL*url=[NSURL URLWithString:@"Prefs:root=General"];
//    Class LSApplicationWorkspace = NSClassFromString(@"LSApplicationWorkspace");
//    [[LSApplicationWorkspace performSelector:@selector(defaultWorkspace)] performSelector:@selector(openSensitiveURL:withOptions:) withObject:url withObject:nil];
    
    NSURL *url = [NSURL URLWithString:@"Prefs:root=General&path=Keyboard"];
   
        // 系统大于10的时候直接打开当前App的设置界面
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
        } else {
            // Fallback on earlier versions
            NSLog(@"打开失败");
             [[UIApplication sharedApplication] openURL:url];
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

/*
新url_Scheme列表 prefs:在iOS10 中改成了Prefs:

电池电量 Prefs:root=BATTERY_USAGE

通用设置 Prefs:root=General

存储空间 Prefs:root=General&path=STORAGE_ICLOUD_USAGE/DEVICE_STORAGE

蜂窝数据 Prefs:root=MOBILE_DATA_SETTINGS_ID

Wi-Fi 设置 Prefs:root=WIFI

蓝牙设置 Prefs:root=Bluetooth

定位设置 Prefs:root=Privacy&path=LOCATION

辅助功能 Prefs:root=General&path=ACCESSIBILITY

关于手机 Prefs:root=General&path=About

键盘设置 Prefs:root=General&path=Keyboard

显示设置 Prefs:root=DISPLAY

声音设置 Prefs:root=Sounds

App Store 设置 Prefs:root=STORE

墙纸设置 Prefs:root=Wallpaper

打开电话 Mobilephone://

世界时钟 Clock-worldclock://

闹钟 Clock-alarm://

秒表 Clock-stopwatch://

倒计时 Clock-timer://

打开相册 Photos://

*/
@end
