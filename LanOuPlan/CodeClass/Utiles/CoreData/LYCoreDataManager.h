//
//  LYCoreDataManager.h
//  LanOuPlan
//
//  Created by zzc-13 on 2018/8/6.
//  Copyright © 2018年 lzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYCoreDataManager : NSObject

/**
 根据source创建一个工具类
 */
- (BOOL)createSqlite:(NSString *)source error:(void (^)(NSString *error))errorBlock;


 /**
  添加数据
  */
- (BOOL)addData:(NSString *)name model:(void (^)(NSObject *model))modelBlock error:(void (^)(NSString *error))errorBlock;

/**
 删除数据

 @param name 实例名称
 @param pre 删除条件
 */
- (BOOL)deleteData:(NSString *)name predicate:(NSPredicate *)pre error:(void (^)(NSString *))errorBlock;

/**
 更新数据

 @param name 实例名称
 @param pre 要更新的数据筛选
 */
- (BOOL)updateData:(NSString *)name predicate:(NSPredicate *)pre modelArr:(void (^)(NSArray *models))modelArrBlock error:(void (^)(NSString *))errorBlock;

/**
 读取数据
 */
- (NSArray *)readData:(NSString *)name predicate:(NSPredicate *)pre error:(void (^)(NSString *))errorBlock;

@end
