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
        ZJCollectionModel *model = [[ZJCollectionModel alloc] initWithDic:dic];
        [resultArray addObject:model];
    }
    return resultArray;
}


-(instancetype)initWithDic:(NSDictionary *)dic{
    if(self = [super init]){
        NSString *link = dic[@"Post"];
        if(link.length <= 0){
            link = @"logo";
        }else{
            link = [NSString stringWithFormat:@"http://47.92.93.38:443%@",link];
        }
        self.imgUrl = link;
        self.content = dic[@"Title"];
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
    
//    AFHTTPSessionManager *manager = [ZJFactory ZJFactoryAFNManage];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    NSLog(@"%@ %@",link,params);
//    [manager POST:link parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject);
//        success(responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        failure(error);
//    }];
}
@end
