//
//  ZJActivityDetailOuterModel.m
//  咩啊
//
//  Created by canoejun on 2020/6/5.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJActivityDetailOuterModel.h"
#import "ZJActivityDetailModel.h"

@implementation ZJActivityDetailOuterModel

+(void)addCollectWithWithLink:(NSString *)link params:(id _Nullable)params success:(successBlock)success failure:(failureBlock)failure{
    [super loadDataWithLink:link params:params success:^(id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(id  _Nullable errror) {
        failure(errror);
    } method:@"POST"];
}
+(void)removeWithLink:(NSString *)link params:(id _Nullable)params success:(successBlock)success failure:(failureBlock)failure{
    [super loadDataWithLink:link params:params success:^(id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(id  _Nullable errror) {
        failure(errror);
    } method:@"POST"];
}

+(void)upLoadDataWithLink:(NSString *)link params:(id _Nullable)params success:(successBlock)success failure:(failureBlock)failure{
    [super loadDataWithLink:link params:params success:^(id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(id  _Nullable errror) {
        failure(errror);
    } method:@"POST"];
}


-(instancetype)initWithDic:(NSDictionary *)dic{
    if(self = [super initWithDic:dic]){
        self.activityDetailModel = [[ZJActivityDetailModel alloc] initWithDic:dic[@"activity_detail"]];
        self.userApplyState = dic[@"user_apply_state"];
        self.userCollectState = dic[@"user_collect_state"];
    }
    return self;
}

@end
