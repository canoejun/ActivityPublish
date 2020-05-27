//
//  ZJBaseNavigationController.m
//  咩啊
//
//  Created by canoejun on 2020/5/23.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJBaseNavigationController.h"

@interface ZJBaseNavigationController ()

@end

@implementation ZJBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self setNavigationBarHidden:YES];
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //    将导航栏进行统一的设置 必须是在调用push之前进行调用的
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIImage * backImage =  [UIImage imageNamed:@"about_back"];
        backImage = [backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backImage style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    }
    
    [super pushViewController:viewController animated:animated];

}
-(void)back {
    [self popViewControllerAnimated:YES];
}


@end
