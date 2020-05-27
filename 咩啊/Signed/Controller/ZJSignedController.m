//
//  ZJSignedController.m
//  咩啊
//
//  Created by canoejun on 2020/5/22.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJSignedController.h"
#import "ZJSignedView.h"

@interface ZJSignedController ()

@end

@implementation ZJSignedController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"已报名的";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.view = [[ZJSignedView alloc] initWithFrame:self.view.bounds];
    
    
}


@end
