//
//  ZJActivityNewsModel.m
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJHomeUniversalModel.h"

@implementation ZJHomeUniversalModel


+(void)loadDataWithLink:(NSString *)link success:(successBlock)success failure:(failureBlock)failure{
    [super loadDataWithLink:link params:nil success:success failure:failure method:@"GET"];
}

+(NSArray *)loadData1{
    
    NSArray *array = @[
        @{
            @"Activity_ID": @"4",
            @"Title": @"毕设像是思维的短假期",
            @"Ogn": @"西南大学学生社团联合会",
            @"Ogn_icon": @"7",
            @"Apply": @"320",
            @"Post": @"2",
            @"Activity_State": @"2"
        },
        @{
            @"Activity_ID": @"3",
            @"Title": @"嗨皮造艺节设计大赛倒计时！",
            @"Ogn": @"西南大学学生社团联合会",
            @"Ogn_icon": @"7",
            @"Apply": @"321",
            @"Post": @"4",
            @"Activity_State": @"2"
        },
        @{
            @"Activity_ID": @"1",
            @"Title": @"复仇者联盟4观影计划",
            @"Ogn": @"西南大学棋艺协会",
            @"Ogn_icon": @"8",
            @"Apply": @"102",
            @"Post": @"1",
            @"Activity_State": @"1"
        },
        @{
            @"Activity_ID": @"2",
            @"Title": @"前方高能！我们在英国牛津等你！",
            @"Ogn": @"西南大学创新创业学院",
            @"Ogn_icon": @"6",
            @"Apply": @"132",
            @"Post": @"5",
            @"Activity_State": @"2"
        }
    ];
    
    NSMutableArray *dataArray = [NSMutableArray array];
    
    for (int i = 0; i < array.count; i++) {
        NSDictionary *dic = array[i];
        ZJHomeUniversalModel *model = [[ZJHomeUniversalModel alloc] initWithDic:dic picLink:@""];
        [dataArray addObject:model];
    }
    
    return dataArray;
}


+(NSArray *)loadDataWith:(NSArray *)dataArray picLink:(nonnull NSString *)link{
    NSMutableArray *resultArray = [NSMutableArray array];
    for (int i = 0; i < dataArray.count; i++) {
        NSDictionary *dic = dataArray[i];
        ZJHomeUniversalModel *model = [[ZJHomeUniversalModel alloc] initWithDic:dic picLink:link];
        [resultArray addObject:model];
    }
    return resultArray;
}


- (instancetype)initWithDic:(NSDictionary *)dic picLink:(NSString *)link{
    if(self = [super init]){
        self.title = dic[@"Title"];
        self.hostUnit = dic[@"Ogn"];
        self.joinPeopleCount = dic[@"Apply"];
        NSString *activityImagelink = dic[@"Post"];
         if(activityImagelink.length <= 0){
             self.activityImageUrl = @"1.jpg";
         }else{
             self.activityImageUrl = [NSString stringWithFormat:@"http://47.92.93.38:443%@",activityImagelink];
         }
        activityImagelink = dic[@"Ogn_icon"];
        if(activityImagelink.length <= 0){
            self.hostIconUrl = @"1.jpg";
        }else{
            self.hostIconUrl = [NSString stringWithFormat:@"http://47.92.93.38:443%@",activityImagelink];
        }
        
        self.activityState = dic[@"Activity_State"];
        self.activityID = dic[@"Activity_ID"];
    }
    return self;
}
@end
