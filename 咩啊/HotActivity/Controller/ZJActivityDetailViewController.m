//
//  ZJActivityDetailViewController.m
//  咩啊
//
//  Created by canoejun on 2020/5/29.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJActivityDetailViewController.h"
#import "ZJActivityDetailView.h"
#import "ZJSignActivityViewController.h"
#import "ZJActivityDetailModel.h"

@interface ZJActivityDetailViewController ()<ActivityDetailViewDelegate>

@end

@implementation ZJActivityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"活动详情";
    
    CGFloat startY = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    startY = startY < 0 ? 0 : startY;
    ZJActivityDetailView *view = [[ZJActivityDetailView alloc] initWithFrame:CGRectMake(0, startY, self.view.frame.size.width, self.view.frame.size.height) detailLink:self.url];
    view.detailViewDelegate = self;
    [self.view addSubview:view];
    
    
}

-(void)signBtnDidClickedWithModel:(ZJActivityDetailModel *)model signBtn:(UIButton * _Nonnull)signBtn{
    ZJSignActivityViewController *signVc = [[ZJSignActivityViewController alloc] init];
//    signVc.model = model;
    signVc.activityID = model.ActivityID;
    signVc.signBtn = signBtn;
    [self.navigationController pushViewController:signVc animated:YES];
}

@end
