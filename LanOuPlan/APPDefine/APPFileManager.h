//
//  APPFileManager.h
//  LanOuPlan
//
//  Created by zzc-13 on 2018/8/19.
//  Copyright © 2018年 lzy. All rights reserved.
//

#import <Foundation/Foundation.h>

static inline NSString *documentDirectory()
{
    static NSString *documentDirectory;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        documentDirectory = [NSString stringWithFormat:@"%@/Documents",NSHomeDirectory()];
    });
    
    return documentDirectory;
}

@interface APPFileManager : NSObject


@end
