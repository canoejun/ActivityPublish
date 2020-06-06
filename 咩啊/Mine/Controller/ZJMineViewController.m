//
//  ZJMineViewController.m
//  咩呀
//
//  Created by canoejun on 2020/5/21.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJMineViewController.h"
#import "ZJMineView.h"
#import "ZJMineNameMottoViewController.h"

@interface ZJMineViewController ()<ZJMineViewDelegate>
@property (nonatomic, strong, readwrite) ZJMineView *mineView;
@end

@implementation ZJMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:({
        self.mineView = [[ZJMineView alloc] initWithFrame:self.view.bounds];
        _mineView.delegate = self;
        _mineView;
    })];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.mineView reload];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

#pragma mark ---------------------ZJMineViewDelegate------------------------------

-(void)pushToNextController:(NSString *)nextControllerName{
    Class ControllerClass = NSClassFromString(nextControllerName);
    
    UIViewController *vc = [[ControllerClass alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)pushToNextController:(NSString *)nextControllerName model:(id)model{
    Class ControllerClass = NSClassFromString(nextControllerName);
    
    ZJMineNameMottoViewController *vc = [[ControllerClass alloc] init];
    vc.model = model;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)showAlertVc:(UIAlertController *)alertVc{
//    [self.navigationController pushViewController:alertVc animated:YES];
    [self presentViewController:alertVc animated:YES completion:^{
        
    }];
}



@end
