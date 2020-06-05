//
//  ZJActivityProjectViewController.m
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJActivityProjectViewController.h"
#import "ZJActivityProjectView.h"
#import "ZJActivityProjectDetailViewController.h"

@interface ZJActivityProjectViewController ()<ActivityProjectCellDidClickedDelagate>

@end

@implementation ZJActivityProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"活动专题";
    ZJActivityProjectView *view = [[ZJActivityProjectView alloc] initWithFrame:self.view.bounds dataSource:self.dataSource];
    view.delegate = self;
    self.view = view;
}

-(void)activityProjectCellDidClicked:(NSString *)detailLink{
    ZJActivityProjectDetailViewController *detailVc = [[ZJActivityProjectDetailViewController alloc] initWithDetailLink:detailLink];
       [self.navigationController pushViewController:detailVc animated:YES];
}


@end
