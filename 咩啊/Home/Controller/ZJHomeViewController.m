//
//  ZJHomeViewController.m
//  咩呀
//
//  Created by canoejun on 2020/5/21.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJHomeViewController.h"
#import "ZJHomeView.h"
#import "ZJBaseViewController.h"
#import "ZJBaseDetailViewController.h"

@interface ZJHomeViewController ()<ZJHomeViewDelegate>

@end

@implementation ZJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"";
    [self __setNavigationBar];
    ZJHomeView *view = [[ZJHomeView alloc] initWithFrame:self.view.bounds];
    view.delegate = self;
    self.view = view;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationController setNavigationBarHidden:NO animated:NO];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationController setNavigationBarHidden:YES animated:NO];
}

#pragma mark ----------------------ZJHomeViewDelegate-----------------------------
- (void)ZJHomeMoreDetailDidClicked:(NSString *)nextControllerName dataSource:(ZJBaseDataSource * _Nullable)dataSource{
    Class cls = NSClassFromString(nextControllerName);
    ZJBaseViewController *vc = [[cls alloc] init];
    vc.dataSource = dataSource;
    [self.navigationController.navigationController pushViewController:vc animated:YES];
}

-(void)ZJHomeCellDidClicked:(NSString *)nextControllerName detailLink:(NSString *)url{
    Class cls = NSClassFromString(nextControllerName);
    ZJBaseDetailViewController *vc = [[cls alloc] init];
    vc.url = url;
    [self.navigationController.navigationController pushViewController:vc animated:YES];
}

#pragma mark ---------------------privateMethod------------------------------
-(void)__setNavigationBar{
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    leftLabel.text = @"咩啊";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftLabel];
}


@end
