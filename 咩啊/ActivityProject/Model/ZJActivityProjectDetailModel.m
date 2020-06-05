//
//  ZJActivityProjectDetailModel.m
//  咩啊
//
//  Created by canoejun on 2020/5/29.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJActivityProjectDetailModel.h"

@implementation ZJActivityProjectDetailModel
+(instancetype)loadDataWithLink:(NSString *)url{
    
    NSDictionary *dic = @{
        @"Class_ID": @"2",
        @"Class_Name": @"忆物",
        @"Class_Content": @"有时候\r\n记忆的存储需要一个载体",
        @"Class_Read_Quantity": @"171",
        @"Class_Apply_Quantity": @"80",
        @"Class_Begin_Time": @"2019.05.16",
        @"Class_End_Time": @"2019.06.01",
        @"Class_State": @"0",
        @"Class_Post": @"10"
    };
    
    ZJActivityProjectDetailModel *model = [[ZJActivityProjectDetailModel alloc] initWithDic:dic];
    return model;
    
}

-(instancetype)initWithDic:(NSDictionary *)dic;{
    if(self = [super init]){
        self.ClassID = dic[@"Class_ID"];
        self.ClassName = dic[@"Class_Name"];
        self.ClassContent = dic[@"Class_Content"];
        self.ClassReadQuantity = dic[ @"Class_Read_Quantity"];
        self.ClassApplyQuantity = dic[@"Class_Apply_Quantity"];
        self.ClassBeginTime = dic[@"Class_Begin_Time"];
        self.ClassEndTime = dic[@"Class_End_Time"];
        self.ClassState = dic[@"Class_State"];
        NSString *link = dic[@"Class_Post"];
        if(link.length <= 0){
            self.ClassPost = @"logo.png";
        }else{
            self.ClassPost = [NSString stringWithFormat:@"http://47.92.93.38:443%@",link];
        }
    }
    return self;
}

@end
