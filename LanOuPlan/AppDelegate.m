//
//  AppDelegate.m
//  LanOuPlan
//
//  Created by zzc-13 on 2018/7/31.
//  Copyright © 2018年 lzy. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController *nava = [[UINavigationController alloc]initWithRootViewController:[[ViewController alloc]init]];
    self.window.rootViewController = nava;
    [self.window makeKeyAndVisible];
 
  
    
    
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    //后续交互需要开发者账户
    NSString *prefix = @"iOSWidgetApp";
    NSLog(@"%@%@%@",app,url,options);
    if ([[url absoluteString] rangeOfString:prefix].location != NSNotFound) {
        NSString *action = [[url absoluteString] substringFromIndex:prefix.length];
        if ([action isEqualToString:@"GotoHomePage"]) {
            NSLog(@"gohome");
        }
        
        if ([action isEqualToString:@"GoBack"]) {
            NSLog(@"GoBack");
            return NO;
        }
        
        
    }
    return YES;
}







@end
