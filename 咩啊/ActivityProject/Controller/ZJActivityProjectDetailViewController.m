//
//  ZJActivityProjectDetailViewController.m
//  咩啊
//
//  Created by canoejun on 2020/5/29.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJActivityProjectDetailViewController.h"
#import "ZJHomeActivityProjectModel.h"
#import "ZJActivityProjectDetailView.h"

@interface ZJActivityProjectDetailViewController ()<ZJActivityDetailViewDelegate>

@end

@implementation ZJActivityProjectDetailViewController

-(instancetype)initWithDetailLink:(NSString *)url{
    if(self = [super init]){
        self.url = url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"专题详情";
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"%f %f %f %f",self.view.frame.origin.x,self.view.frame.origin.y,self.view.frame.size.width,self.view.frame.size.height);
    
    CGFloat startY = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    startY = startY < 0 ? 0 : startY;
    ZJActivityProjectDetailView *view = [[ZJActivityProjectDetailView alloc] initWithFrame:CGRectMake(0, startY, self.view.frame.size.width, self.view.frame.size.height) detailLink:self.url];
//    NSLog(@"%@",self.url);
    view.detailViewDelegate = self;
    [self.view addSubview:view];

}

-(void)activityDetailTableViewCellDidClicked:(NSString *)nextControllerName detailLink:(NSString *)url{
    Class cls = NSClassFromString(nextControllerName);
    ZJBaseDetailViewController *vc = [[cls alloc] init];
    vc.url = url;
    [self.navigationController pushViewController:vc animated:YES];
}



@end
