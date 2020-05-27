//
//  ZJActivityNewsModel.m
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJActivityNewsModel.h"

@implementation ZJActivityNewsModel
+(NSArray *)loadData{
    //    return nil;
//    self.title = dic[@"title"];
//    self.hostUnit = dic[@"hostUnit"];
//    self.joinPeopleCount = dic[@"joinPeopleCount"];
//    self.activityImageUrl = dic[@"activityImageUrl"];
//    self.littleImageUrl = dic[@"littleImageUrl"];
    
    NSArray *array = @[
        @{
            @"hostUnit":@"icon1",
            @"title":@"1",
            @"joinPeopleCount":@"3",
            @"activityImageUrl":@"icon",
            @"littleImageUrl":@"icon"
        },
        @{
            @"hostUnit":@"icon2",
            @"title":@"2",
            @"joinPeopleCount":@"4",
            @"activityImageUrl":@"icon",
            @"littleImageUrl":@"icon"
        },
        @{
            @"hostUnit":@"icon3",
            @"title":@"3",
            @"joinPeopleCount":@"5",
            @"activityImageUrl":@"icon",
            @"littleImageUrl":@"icon"
        },
        @{
            @"hostUnit":@"icon4",
            @"title":@"4",
            @"joinPeopleCount":@"6",
            @"activityImageUrl":@"icon",
            @"littleImageUrl":@"icon"
        },
        @{
            @"hostUnit":@"icon5",
            @"title":@"5",
            @"joinPeopleCount":@"7",
            @"activityImageUrl":@"icon",
            @"littleImageUrl":@"icon"
        },
    ];
    
    NSMutableArray *dataArray = [NSMutableArray array];
    
    for (int i = 0; i < array.count; i++) {
        NSDictionary *dic = array[i];
        ZJActivityNewsModel *model = [[ZJActivityNewsModel alloc] initWithDic:dic];
        [dataArray addObject:model];
    }
    
    return dataArray;
}
-(instancetype)initWithDic:(NSDictionary *)dic{
    if(self = [super init]){
        self.title = dic[@"title"];
        self.hostUnit = dic[@"hostUnit"];
        self.joinPeopleCount = dic[@"joinPeopleCount"];
        self.activityImageUrl = dic[@"activityImageUrl"];
        self.littleImageUrl = dic[@"littleImageUrl"];
    }
    return self;
}
@end
