//
//  ZJHomeHotActivityModel.m
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJHomeHotActivityModel.h"

@implementation ZJHomeHotActivityModel
+(NSArray *)loadData{
    //    return nil;
    
    NSArray *array = @[
        @{
            @"imgUrl":@"icon",
            @"title":@"1"
        },
        @{
            @"imgUrl":@"icon",
            @"title":@"2"
        },
        @{
            @"imgUrl":@"icon",
            @"title":@"3"
        },
        @{
            @"imgUrl":@"icon",
            @"title":@"4"
        },
        @{
            @"imgUrl":@"icon",
            @"title":@"5"
        },
    ];
    
    NSMutableArray *dataArray = [NSMutableArray array];
    
    for (int i = 0; i < array.count; i++) {
        NSDictionary *dic = array[i];
        ZJHomeHotActivityModel *model = [[ZJHomeHotActivityModel alloc] initWithDic:dic];
        [dataArray addObject:model];
    }
    
    return dataArray;
}
-(instancetype)initWithDic:(NSDictionary *)dic{
    if(self = [super init]){
        self.title = dic[@"title"];
        self.detailTitle = dic[@"imgUrl"];
    }
    return self;
}
@end
