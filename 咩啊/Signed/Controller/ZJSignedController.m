//
//  ZJSignedController.m
//  咩啊
//
//  Created by canoejun on 2020/5/22.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJSignedController.h"
#import "ZJSignedView.h"

@interface ZJSignedController ()<ZJSignViewDelegate>
@property (nonatomic, strong, readwrite) ZJSignedView *signView;
@end

@implementation ZJSignedController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"已报名的";
    self.view.backgroundColor = [UIColor whiteColor];
    self.signView = [[ZJSignedView alloc] initWithFrame:self.view.bounds];
    self.view = _signView;
    _signView.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_signView updateData];
}

-(void)signViewCellDidClicked:(NSString *)nextController detailLink:(NSString *)url{
    Class cls = NSClassFromString(nextController);
    ZJBaseDetailViewController *vc = [[cls alloc] init];
    vc.url = url;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
