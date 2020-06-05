//
//  ZJMineNameMottoModel.m
//  咩啊
//
//  Created by canoejun on 2020/5/30.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJMineNameMottoModel.h"
#import "ZJMineHeadViewBannerModel.h"

@implementation ZJMineNameMottoModel
+(NSArray *)loadDataWithModel:(ZJMineHeadViewBannerModel *)model{
    NSArray *arry = @[
        @{
            @"remind":@"昵称",
            @"content":model.name
        },
        @{
            @"remind":@"座右铭",
            @"content":model.motto
        }
    ];
    
    NSMutableArray *dataArray = [NSMutableArray array];
    for (int i = 0; i < arry.count; i++) {
        NSDictionary *dic = arry[i];
        ZJMineNameMottoModel *model = [[ZJMineNameMottoModel alloc] initWithDic:dic];
        [dataArray addObject:model];
    }
    
    return dataArray;
}

-(instancetype)initWithDic:(NSDictionary *)dic{
    if(self  = [super init]){
        self.remind = dic[@"remind"];
        self.content = dic[@"content"];
    }
    return  self;
}


@end
