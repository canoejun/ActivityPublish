//
//  ZJHistoryActivityController.m
//  咩啊
//
//  Created by canoejun on 2020/5/23.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJHistoryActivityController.h"
#import "ZJHistoryView.h"

@interface ZJHistoryActivityController ()

@end

@implementation ZJHistoryActivityController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"历史活动";
    self.view.backgroundColor = [UIColor whiteColor];
    self.view = [[ZJHistoryView alloc] initWithFrame:self.view.bounds];
    
}

@end
