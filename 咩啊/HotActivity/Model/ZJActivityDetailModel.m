//
//  ZJActivityDetailModel.m
//  咩啊
//
//  Created by canoejun on 2020/5/29.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJActivityDetailModel.h"

@implementation ZJActivityDetailModel

+(instancetype)loadDataWithLink:(NSString *)url{
    
    NSDictionary *dic = @{
        @"Activity_ID": @"1",
        @"Ogn_Name": @"西南大学棋艺协会",
        @"Ogn_Icon": @"hot_2",
        @"Title": @"棋艺大赛",
        @"Time": @"2019年06月04日 - 星期二",
        @"Begin_Time": @"14:30",
        @"End_Time": @"17:00",
        @"Activity_State": @"1",
        @"Content": @"棋艺大赛具体详情，请加棋艺大赛咨询群：604676912",
        @"Read_Quantity": @"20",
        @"Total_Quantity": @"11",
        @"Apply_Quantity": @"1",
        @"Sign_Begin_Time": @"14:00",
        @"Sign_End_Time": @"14:30",
        @"Post": @"hot_2",
        @"Position": @"西南大学第四运动场",
        @"Publish_Time": @"20:53"
    };
    
    
    ZJActivityDetailModel *model = [[ZJActivityDetailModel alloc] initWithDic:dic];
    return model;
    
}


-(instancetype)initWithDic:(NSDictionary *)dic{
    if(self = [super init]){
        self.ActivityID = dic[@"Activity_ID"];
        self.OgnName = dic[@"Ogn_Name"];
        
        self.Title = dic[@"Title"];
        self.Time = dic[@"Time"];
        self.BeginTime = dic[@"Begin_Time"];
        self.EndTime = dic[@"End_Time"];
        self.ActivityState = dic[@"Activity_State"];
        self.Content = dic[@"Content"];
        self.ReadQuantity = dic[@"Read_Quantity"];
        self.TotalQuantity = dic[@"Total_Quantity"];
        self.ApplyQuantity = dic[@"Apply_Quantity"];
        self.SignBeginTime = dic[@"Sign_Begin_Time"];
        self.SignEndTime = dic[@"Sign_End_Time"];
        NSString *activityImagelink = dic[@"Post"];
        if(activityImagelink.length <= 0){
            self.Post = @"1.jpg";
        }else{
            self.Post = [NSString stringWithFormat:@"http://47.92.93.38:443%@",activityImagelink];
        }
        activityImagelink = dic[@"Ogn_Icon"];
        if(activityImagelink.length <= 0){
            self.OgnIcon = @"1.jpg";
        }else{
            self.OgnIcon = [NSString stringWithFormat:@"http://47.92.93.38:443%@",activityImagelink];
        }
        
        self.Position = dic[@"Position"];
        self.PublishTime = dic[@"Publish_Time"];
    }
    return self;
}
@end
