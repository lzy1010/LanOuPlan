//
//  UIDevice+User.h
//  LanOuPlan
//
//  Created by zzc-13 on 2018/8/19.
//  Copyright © 2018年 lzy. All rights reserved.
//

#import <UIKit/UIKit.h>

static inline NSString *UUID()
{
    static NSString *app_uuid;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
        static NSString* UUID_KEY = @"CDVUUID";
        
        app_uuid = [userDefaults stringForKey:UUID_KEY];
        
        if (app_uuid == nil) {
            CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
            CFStringRef uuidString = CFUUIDCreateString(kCFAllocatorDefault, uuidRef);
            
            app_uuid = [NSString stringWithString:(__bridge NSString*)uuidString];
            [userDefaults setObject:app_uuid forKey:UUID_KEY];
            [userDefaults synchronize];
            
            CFRelease(uuidString);
            CFRelease(uuidRef);
        }
    });
    
    return app_uuid;
}

@interface UIDevice (User)



@end
