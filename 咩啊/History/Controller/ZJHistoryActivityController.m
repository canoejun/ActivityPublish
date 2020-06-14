//
//  ZJHistoryActivityController.m
//  咩啊
//
//  Created by canoejun on 2020/5/23.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJHistoryActivityController.h"
#import "ZJHistoryView.h"
#import "ZJBaseDetailViewController.h"

@interface ZJHistoryActivityController ()<ZJHistoryViewDelegate>

@end

@implementation ZJHistoryActivityController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"历史活动";
    self.view.backgroundColor = [UIColor whiteColor];
    ZJHistoryView *view = [[ZJHistoryView alloc] initWithFrame:self.view.bounds];
    view.delegate = self;
    self.view = view;
    
}

- (void)historyViewCellDidClickedNextController:(NSString *)nextController detailLink:(NSString *)url{
    Class cls = NSClassFromString(nextController);
    ZJBaseDetailViewController *vc = [[cls alloc] init];
    vc.url = url;
    [self.navigationController pushViewController:vc animated:YES];
}



@end
