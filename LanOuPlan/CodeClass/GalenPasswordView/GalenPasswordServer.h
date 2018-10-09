//
//  GalenPasswordServer.h
//  LanOuPlan
//
//  Created by monda on 2018/10/9.
//  Copyright © 2018 lzy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GalenPasswordServer : NSObject

@property(strong,nonatomic)NSString *api;


-(void)ServerByApi:(NSString *)api;



@end

NS_ASSUME_NONNULL_END
