//
//  ZJMineNameMottoViewController.m
//  咩啊
//
//  Created by canoejun on 2020/5/30.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJMineNameMottoViewController.h"
#import "ZJMineNameMottoView.h"
#import "ZJMineHeadViewBannerModel.h"

@interface ZJMineNameMottoViewController ()<ZJMineNameMottoDelegate>

@end

@implementation ZJMineNameMottoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"昵称和座右铭";
    
    CGFloat startY = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    ZJMineNameMottoView *view = [[ZJMineNameMottoView alloc] initWithFrame:CGRectMake(0, startY < 0 ? 0 : startY, self.view.bounds.size.width, self.view.frame.size.height) model:self.model];
    view.delegate = self;
    self.view = view;
    
}

-(void)showAlertVc:(UIAlertController *)alertVc{
    [self presentViewController:alertVc animated:YES completion:nil];
}
-(void)updateNameMottoModel:(id)model{
//    上传数据，更新界面
    [ZJMineHeadViewBannerModel upDateNameMottoDataWithModel:(ZJMineHeadViewBannerModel *)model];
    [self.navigationController popoverPresentationController];
    [self.navigationController popoverPresentationController];
}
@end
