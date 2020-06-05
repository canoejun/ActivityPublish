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
+(NSArray *)loadDataWith:(NSArray *)dataArray picLink:(nonnull NSString *)link{
    NSMutableArray *resultArray = [NSMutableArray array];
    for (int i = 0; i < dataArray.count; i++) {
        NSDictionary *dic = dataArray[i];
        ZJSignedModel *model = [[ZJSignedModel alloc] initWithDic:dic picLink:link];
        [resultArray addObject:model];
    }
    return resultArray;
}

-(instancetype)initWithDic:(NSDictionary *)dic picLink:(NSString *)link{
    if(self = [super initWithDic:dic picLink:link]){
        self.title = dic[@"Title"];
        self.time = dic[@"Begin_time"];
        self.imageUrl = dic[@"Post"];
        self.location = dic[@"Position"];
        self.activityID = dic[@"Activity_ID"];
    }
    return self;
}






@end
