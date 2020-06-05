//
//  ZJSignActivityViewController.m
//  咩啊
//
//  Created by canoejun on 2020/5/30.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJSignActivityViewController.h"
#import "ZJSignActivityView.h"

@interface ZJSignActivityViewController ()

@end

@implementation ZJSignActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"报名";

    CGFloat startY = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    ZJSignActivityView *view = [[ZJSignActivityView alloc] initWithFrame:CGRectMake(0, startY < 0 ? 0 : startY, self.view.frame.size.width, self.view.frame.size.height - startY)];
    [self.view addSubview:view];
}



@end
