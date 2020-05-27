//
//  ZJHomeViewController.m
//  咩呀
//
//  Created by canoejun on 2020/5/21.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJHomeViewController.h"
#import "ZJHomeView.h"

@interface ZJHomeViewController ()<ZJHomeViewDelegate>

@end

@implementation ZJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"";
//    self.view.backgroundColor = [UIColor redColor];
    
    [self __setNavigationBar];
    
    
    
    [self.view addSubview:({
        ZJHomeView *view = [[ZJHomeView alloc] initWithFrame:self.view.bounds];
        view.delegate = self;
        view;
    })];
    
    
}

//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    NSLog(@"%d %d %@",self.navigationController.navigationController.isNavigationBarHidden,NO,self.navigationController.navigationController);
//    if(!self.navigationController.navigationController.isNavigationBarHidden){
//        [self.navigationController.navigationController setNavigationBarHidden:YES animated:NO];
//    }
//}



#pragma ----------------------ZJHomeViewDelegate-----------------------------
- (void)ZJHomeMoreDetailDidClicked:(NSString *)nextControllerName{
    Class cls = NSClassFromString(nextControllerName);
    UIViewController *vc = [[cls alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma ---------------------privateMethod------------------------------
-(void)__setNavigationBar{
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    leftLabel.text = @"咩啊";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftLabel];
}


@end
