//
//  ZJActivityProjectModel.m
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJHomeActivityProjectModel.h"


@implementation ZJHomeActivityProjectModel

+(NSArray *)loadData{
    //    return nil;
    
    NSArray *array = @[
        @{
            @"Class_ID": @"2",
            @"Class_Name": @"忆物",
            @"Class_Begin_Time": @"2019.05.16",
            @"Class_End_Time": @"2019.06.01",
            @"Class_State": @"0",
            @"Class_Post": @"10"
        },
        @{
            @"Class_ID": @"3",
            @"Class_Name": @"学生海外交流",
            @"Class_Begin_Time": @"2019.05.16",
            @"Class_End_Time": @"2019.05.18",
            @"Class_State": @"2",
            @"Class_Post": @"3"
        },
        @{
            @"Class_ID": @"4",
            @"Class_Name": @"十年漫威，英雄不老",
            @"Class_Begin_Time": @"2019.05.08",
            @"Class_End_Time": @"2019.05.16",
            @"Class_State": @"0",
            @"Class_Post": @"9"
        },
        @{
            @"Class_ID": @"1",
            @"Class_Name": @"无分类",
            @"Class_Begin_Time": @"",
            @"Class_End_Time": @"",
            @"Class_State": @"0",
            @"Class_Post": @"hot_1"
        }
    ];
    
    NSMutableArray *dataArray = [NSMutableArray array];
    
    for (int i = 0; i < array.count; i++) {
        NSDictionary *dic = array[i];
        ZJHomeActivityProjectModel *model = [[ZJHomeActivityProjectModel alloc] initWithDic:dic picLink:@""];
        [dataArray addObject:model];
    }
    
    return dataArray;
}

+(NSArray *)loadDataWith:(NSArray *)dataArray picLink:(nonnull NSString *)link{
    NSMutableArray *resultArray = [NSMutableArray array];
    for (int i = 0; i < dataArray.count; i++) {
        NSDictionary *dic = dataArray[i];
        ZJHomeActivityProjectModel *model = [[ZJHomeActivityProjectModel alloc] initWithDic:dic picLink:link];
        [resultArray addObject:model];
    }
    return resultArray;
}

-(instancetype)initWithDic:(NSDictionary *)dic picLink:(NSString *)picLink{
    if(self = [super initWithDic:dic picLink:picLink]){
        self.ClassID = dic[@"Class_ID"];
        self.ClassName = dic[@"Class_Name"];
        self.ClassBeginTime = dic[@"Class_Begin_Time"];
        self.ClassEndTime = dic[@"Class_End_Time"];
        self.ClassState = dic[@"Class_State"];
        NSString *picLink = dic[@"Class_Post"];
        self.ClassImageUrl = @"1.jpg";
        if(picLink.length <= 0){
            self.ClassImageUrl = @"1.jpg";
        }else{
             self.ClassImageUrl = [NSString stringWithFormat:@"http://47.92.93.38:443%@" ,picLink];
        }
    }
    return self;
}


+(void)loadDataWithLink:(NSString *)link success:(successBlock)success failure:(failureBlock)failure{
    [super loadDataWithLink:link params:nil success:^(id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(id  _Nullable errror) {
        failure(errror);
    } method:@"GET"];
}



@end
