//
//  NotePageViewController.h
//  LanOuPlan
//
//  Created by zzc-13 on 2018/10/7.
//  Copyright © 2018年 lzy. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, NotePageState) {
    NotePageStateDefault,
    NotePageStatePulling,
    NotePageStatePulled,
    NotePageStateEdting,
};

@interface NotePageViewController : BaseViewController

@property (assign, nonatomic) NotePageState state;

@end

NS_ASSUME_NONNULL_END
