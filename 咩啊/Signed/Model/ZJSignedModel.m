//
//  ZJSignedModel.m
//  咩啊
//
//  Created by canoejun on 2020/5/23.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJSignedModel.h"

@implementation ZJSignedModel
+(NSArray *)loadSignedData{
//    发出网络请求
    return @[
        @{
            @"title":@"测试1",
            @"location":@"1",
            @"time":@"1",
            @"imageUrl":@"icon"
        },
        @{
            @"title":@"测试2",
            @"location":@"2",
            @"time":@"2",
            @"imageUrl":@"icon"
        },
        @{
            @"title":@"测试3",
            @"location":@"3",
            @"time":@"3",
            @"imageUrl":@"icon"
        }
    ];
    
//    return nil;
}




@end
