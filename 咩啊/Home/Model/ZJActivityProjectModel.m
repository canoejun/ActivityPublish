//
//  ZJActivityProjectModel.m
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJActivityProjectModel.h"

@implementation ZJActivityProjectModel

+(NSArray *)loadData{
    //    return nil;
    
    NSArray *array = @[
        @{
            @"imgUrl":@"collection_default",
            @"title":@"1"
        },
        @{
            @"imgUrl":@"collection_default",
            @"title":@"2"
        },
        @{
            @"imgUrl":@"collection_default",
            @"title":@"3"
        },
        @{
            @"imgUrl":@"collection_default",
            @"title":@"4"
        },
        @{
            @"imgUrl":@"collection_default",
            @"title":@"5"
        },
    ];
    
    NSMutableArray *dataArray = [NSMutableArray array];
    
    for (int i = 0; i < array.count; i++) {
        NSDictionary *dic = array[i];
        ZJActivityProjectModel *model = [[ZJActivityProjectModel alloc] initWithDic:dic];
        [dataArray addObject:model];
    }
    
    return dataArray;
}
-(instancetype)initWithDic:(NSDictionary *)dic{
    if(self = [super init]){
        self.title = dic[@"title"];
        self.imgUrl = dic[@"imgUrl"];
    }
    return self;
}




@end
