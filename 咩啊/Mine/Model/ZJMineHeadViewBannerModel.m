//
//  ZJMineHeadViewBannerModel.m
//  咩啊
//
//  Created by canoejun on 2020/5/30.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJMineHeadViewBannerModel.h"

@implementation ZJMineHeadViewBannerModel
+(instancetype)loadDataWithLink:(NSString *)nameLink mottoLink:(NSString *)mottoLink{
    ZJMineHeadViewBannerModel *model = [[ZJMineHeadViewBannerModel alloc] init];
    
    model.name = @"我的名字";
    model.motto = @"我的座右铭";
    NSLog(@"加载昵称和座右铭");
    
    return model;
}


@end
