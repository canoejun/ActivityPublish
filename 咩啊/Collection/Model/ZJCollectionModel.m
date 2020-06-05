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

+(NSArray *)loadDataWith:(NSArray *)dataArray picLink:(nonnull NSString *)link{
    NSMutableArray *resultArray = [NSMutableArray array];
    for (int i = 0; i < dataArray.count; i++) {
        NSDictionary *dic = dataArray[i];
        ZJCollectionModel *model = [[ZJCollectionModel alloc] initWithDic:dic picLink:link];
        [resultArray addObject:model];
    }
    return resultArray;
}


-(instancetype)initWithDic:(NSDictionary *)dic{
    if(self = [super init]){
        self.imgUrl = dic[@"imgUrl"];
        self.content = dic[@"content"];
        self.selected = [dic[@"selected"] boolValue];
        self.activityID = dic[@"Activity_ID"];
        self.activityState = dic[@"Activity_State"];
    }
    return self;
}


+(void)removeDataWithLink:(NSString *)link params:(id _Nullable)params success:(successBlock)success failure:(failureBlock)failure{
    [super loadDataWithLink:link params:params success:^(id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(id  _Nullable errror) {
        failure(errror);
    } method:@"POST"];
}
@end
