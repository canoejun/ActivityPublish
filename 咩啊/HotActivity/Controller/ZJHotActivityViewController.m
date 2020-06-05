//
//  ZJHotActivityViewController.m
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJHotActivityViewController.h"
#import "ZJHotActivityView.h"
#import "ZJBaseDetailViewController.h"

@interface ZJHotActivityViewController ()<ZJHotActivityViewDelegate>

@end

@implementation ZJHotActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"活动热榜";
    
    ZJHotActivityView *view = [[ZJHotActivityView alloc] initWithFrame:self.view.bounds dataSource:self.dataSource];
    view.delegate = self;
    self.view  = view;
}

-(void)hotActivityViewCellDidClicked:(NSString *)nextController detailLink:(NSString *)url{
    Class cls = NSClassFromString(nextController);
    ZJBaseDetailViewController *vc = [[cls alloc] init];
    vc.url = url;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
