//
//  NotePageViewController.m
//  LanOuPlan
//
//  Created by zzc-13 on 2018/10/7.
//  Copyright © 2018年 lzy. All rights reserved.
//

#import "NotePageViewController.h"
#import <RETableViewManager/RETableViewManager.h>
#import <Masonry/Masonry.h>

@interface NotePageViewController ()<RETableViewManagerDelegate>

@property (strong, nonatomic) RETableViewManager *sourceManager;

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation NotePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] init];
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.alwaysBounceVertical = true;
        
        tableView;
    });
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    
    self.sourceManager = ({
        RETableViewManager *manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
        manager.delegate = self;
        
        manager;
    });
    
    self.state = NotePageStateDefault;
    
    if (@available(iOS 11.0, *)) {
        [self.tableView setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    } else {
        // Fallback on earlier versions
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"%f",offsetY);
    
    if (self.state == NotePageStateEdting) {
        return;
    }
    
    if (offsetY > -40) {
        self.state = NotePageStateDefault;
    }else if (offsetY > -80){
        self.state = NotePageStatePulling;
    }else if(offsetY > -120){
        if (scrollView.dragging == true) {
            self.state = NotePageStatePulled;
        }else{
            self.state = NotePageStateEdting;
        }
    }
}

#pragma mark set/get
- (void)setState:(NotePageState)state{
    if (_state == state) {
        return;
    }
    
    _state = state;
    
    switch (state) {
        case NotePageStateDefault:
            self.navigationItem.title = @"+新建待办事件...";
            break;
        case NotePageStatePulling:
            self.navigationItem.title = @"↓新建待办事件...";
            break;
        case NotePageStatePulled:
            self.navigationItem.title = @"↑松手添加待办事件...";
            break;
        case NotePageStateEdting:
            self.navigationItem.title = @"正在新建待办事件...";
            break;
            
        default:
            break;
    }
}


@end
