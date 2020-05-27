//
//  ZJCollectionModel.m
//  咩啊
//
//  Created by canoejun on 2020/5/24.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJCollectionModel.h"

@implementation ZJCollectionModel
+(NSArray *)loadCollectionData{
    
//    加载网络数据
//    return nil;
    
    NSArray *array = @[
        @{
            @"imgUrl":@"icon",
            @"content":@"1",
            @"selected":@"NO"
        },
        @{
            @"imgUrl":@"icon",
            @"content":@"2",
            @"selected":@"NO"
        },
        @{
            @"imgUrl":@"icon",
            @"content":@"3",
            @"selected":@"NO"
        },
        @{
            @"imgUrl":@"icon",
            @"content":@"4",
            @"selected":@"NO"
        },
        @{
            @"imgUrl":@"icon",
            @"content":@"5",
            @"selected":@"NO"
        },
        @{
            @"imgUrl":@"icon",
            @"content":@"6",
            @"selected":@"NO"
        }
    ];
    
    NSMutableArray *dataArray = [NSMutableArray array];
    
    for (int i = 0; i < array.count; i++) {
        NSDictionary *dic = array[i];
        ZJCollectionModel *model = [[ZJCollectionModel alloc] initWithDic:dic];
        [dataArray addObject:model];
    }
    
    return dataArray;
    
}


-(instancetype)initWithDic:(NSDictionary *)dic{
    if(self = [super init]){
        self.imgUrl = dic[@"imgUrl"];
        self.content = dic[@"content"];
        self.selected = [dic[@"selected"] boolValue];
    }
    return self;
}
@end
