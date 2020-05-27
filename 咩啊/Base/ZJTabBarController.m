//
//  ZJTabBarController.m
//  咩呀
//
//  Created by canoejun on 2020/5/21.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJTabBarController.h"
#import "ZJHomeViewController.h"
#import "ZJMineViewController.h"

@interface ZJTabBarController ()

@end

@implementation ZJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self __setUPChildVC];
    
}

-(void)__setUPChildVC{
    
//    [self __addChildVCWithClass:[ZJHomeViewController new] image:@"home" selImage:@"home_sel" title:@"主页"];
    UIViewController *homeVc = [self __buildChildVCWithClass:[ZJHomeViewController new] image:@"home" selImage:@"home_sel" title:@"主页"];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:homeVc];
    [self addChildViewController:nav];
    
    UIViewController *mineVc = [self __buildChildVCWithClass:[ZJMineViewController new] image:@"mine" selImage:@"mine_sel" title:@"我的"];
    [self addChildViewController:mineVc];
    
}


-(UIViewController *)__buildChildVCWithClass:(UIViewController *)vc image:(NSString *)imageName selImage:(NSString *)selImageName title:(NSString *)title{
    
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return vc;
}



@end
