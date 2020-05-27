//
//  ZJMineViewController.m
//  咩呀
//
//  Created by canoejun on 2020/5/21.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJMineViewController.h"
#import "ZJMineView.h"

@interface ZJMineViewController ()<ZJMineViewDelegate>

@end

@implementation ZJMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:({
        ZJMineView *view = [[ZJMineView alloc] initWithFrame:self.view.bounds];
        view.delegate = self;
        view;
    })];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

#pragma ---------------------ZJMineViewDelegate------------------------------

-(void)pushToNextController:(NSString *)nextControllerName{
    Class ControllerClass = NSClassFromString(nextControllerName);
    
    UIViewController *vc = [[ControllerClass alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)showAlertVc:(UIAlertController *)alertVc{
//    [self.navigationController pushViewController:alertVc animated:YES];
    [self presentViewController:alertVc animated:YES completion:^{
        
    }];
}



@end
