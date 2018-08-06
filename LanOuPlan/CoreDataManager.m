//
//  CoreDataManager.m
//  LanOuPlan
//
//  Created by zzc-13 on 2018/8/6.
//  Copyright © 2018年 lzy. All rights reserved.
//

#import "CoreDataManager.h"
#import <CoreData/CoreData.h>

@interface CoreDataManager ()

@property (nonatomic, readwrite, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, readwrite, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, readwrite, strong) NSManagedObjectContext *context;

@end

@implementation CoreDataManager

- (BOOL)createSqlite:(NSString *)source error:(void (^)(NSString *))errorBlock{
    self.managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:source withExtension:@"momd"]];
    
    // 创建 coordinator 需要传入 managedObjectModel
    self.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    // 指定本地的 sqlite 数据库文件
    NSURL *sqliteURL = [[self documentDirectoryURL] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite",source]];
    NSError *error;
    // 为 persistentStoreCoordinator 指定本地存储的类型，这里指定的是 SQLite
    [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                              configuration:nil
                                                        URL:sqliteURL
                                                    options:nil
                                                      error:&error];
    if (error && errorBlock) {
        errorBlock(error.description);
        return false;
    }
    
    self.context = [[NSManagedObjectContext alloc ] initWithConcurrencyType:NSMainQueueConcurrencyType];
    self.context.persistentStoreCoordinator = self.persistentStoreCoordinator;
    
    return true;
}

- (BOOL)addData:(NSString *)name model:(void (^)(NSObject *))modelBlock error:(void (^)(NSString *))errorBlock{
    NSObject *obj = [NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:self.context];
    
    if (!obj) {
        errorBlock(@"没有这个entity");
    }
    
    if (modelBlock) {
        modelBlock(obj);
    }
    
    NSError *error;
    [self.context save:&error];
    
    if (error && errorBlock) {
        errorBlock(error.description);
        return false;
    }
    
    return true;
}

- (BOOL)deleteData:(NSString *)name predicate:(NSPredicate *)pre error:(void (^)(NSString *))errorBlock{
    NSFetchRequest *deleRequest = [NSFetchRequest fetchRequestWithEntityName:name];
    deleRequest.predicate = pre;
    
    NSArray *deleArray = [self.context executeFetchRequest:deleRequest error:nil];
    
    if (!deleArray) {
        errorBlock(@"查找不到相关数据");
        
        return false;
    }
    
    [deleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.context deleteObject:obj];
    }];
    
    NSError *error;
    [self.context save:&error];
    
    if (error && errorBlock) {
        errorBlock(error.description);
        return false;
    }
    
    return true;
}

- (BOOL)updateData:(NSString *)name predicate:(NSPredicate *)pre modelArr:(void (^)(NSArray *models))modelArrBlock error:(void (^)(NSString *))errorBlock{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:name];
    request.predicate = pre;
    
    NSArray *resArray = [_context executeFetchRequest:request error:nil];
    
    if (!resArray) {
        errorBlock(@"查找不到相关数据");
        
        return false;
    }
    
    if (modelArrBlock) {
        modelArrBlock(resArray);
    }
    
    NSError *error;
    [self.context save:&error];
    
    if (error && errorBlock) {
        errorBlock(error.description);
        return false;
    }
    
    return true;
}

- (NSArray *)readData:(NSString *)name predicate:(NSPredicate *)pre error:(void (^)(NSString *))errorBlock{
    NSFetchRequest *deleRequest = [NSFetchRequest fetchRequestWithEntityName:name];
    deleRequest.predicate = pre;
    
    NSArray *dataArr = [self.context executeFetchRequest:deleRequest error:nil];
    
    return dataArr;
}



// 用来获取 document 目录
- (nullable NSURL *)documentDirectoryURL {
    return [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
}

@end
