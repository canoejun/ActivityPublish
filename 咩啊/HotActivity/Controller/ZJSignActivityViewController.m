//
//  ZJSignActivityViewController.m
//  咩啊
//
//  Created by canoejun on 2020/5/30.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJSignActivityViewController.h"
#import "ZJSignActivityView.h"
#import "SVProgressHUD/SVProgressHUD.h"

@interface ZJSignActivityViewController ()<ZJSignActivityViewDelegate>

@end

@implementation ZJSignActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"报名";

    CGFloat startY = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    startY = startY < 0 ? 0 : startY;
    ZJSignActivityView *view = [[ZJSignActivityView alloc] initWithFrame:CGRectMake(0,startY, self.view.frame.size.width, self.view.frame.size.height - startY)];
    view.currentActivityID = self.activityID;
    view.signBtn = self.signBtn;
    view.delegate = self;
    [self.view addSubview:view];
}


-(void)popViewController{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
        [self.navigationController popViewControllerAnimated:YES];
    });
    
}


@end
