//
//  ZJMineHeadViewBannerModel.m
//  咩啊
//
//  Created by canoejun on 2020/5/30.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJMineHeadViewBannerModel.h"
#import "ZJUsersModel.h"

@implementation ZJMineHeadViewBannerModel

+(void)loadNameMottoData:(void(^)(ZJMineHeadViewBannerModel *model))block{
    ZJUsersModel *userModel = [ZJUsersModel shareInstance];
    
    ZJMineHeadViewBannerModel *model = [[ZJMineHeadViewBannerModel alloc] init];
    
    if(userModel.name.length > 0 && userModel.motto.length > 0){
        model.name = userModel.name;
        model.motto = userModel.motto;
        block(model);
    }
    
    [super loadDataWithLink:@"http://47.92.93.38:443/user/select" params:userModel.userid success:^(id  _Nullable responseObject) {
        userModel.name = responseObject[@"User_Name"];
        userModel.motto = responseObject[@"Other"];
        model.name = userModel.name;
        model.motto = userModel.motto;
        [ZJUsersModel synchronize];
        block(model);
    } failure:^(id  _Nullable errror) {
        NSLog(@"获取用户信息失败 %@",errror);
    } method:@"POST"];
    
}

+(instancetype)loadNameMottoData{
    ZJUsersModel *userModel = [ZJUsersModel shareInstance];
    
    ZJMineHeadViewBannerModel *model = [[ZJMineHeadViewBannerModel alloc] init];
    
    if(userModel.name.length > 0 || userModel.motto.length > 0){
        return model;
    }
    //    dispatch_semaphore_t signal = dispatch_semaphore_create(0);
    //    dispatch_async(dispatch_get_global_queue(0, 0), ^{
    //
    //            [super loadDataWithLink:@"http://47.92.93.38:443/user/select" params:userModel.userID success:^(id  _Nullable responseObject) {
    //            dispatch_semaphore_signal(signal);
    //            NSLog(@"%@",responseObject);
    //            userModel.name = responseObject[@"User_Name"];
    //            userModel.motto = responseObject[@"Other"];
    //            [ZJUsersModel synchronize];
    //        } failure:^(id  _Nullable errror) {
    //            dispatch_semaphore_signal(signal);
    //            NSLog(@"获取用户信息失败 %@",errror);
    //        } method:@"POST"];
    //
    //        NSLog(@"%@",[NSThread currentThread]);
    //
    //    });
    //    dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
    
    
    
    
    //    dispatch_queue_t queue = dispatch_queue_create("loadName", DISPATCH_QUEUE_CONCURRENT);
    //    dispatch_async(queue, ^{
    //                [super loadDataWithLink:@"http://47.92.93.38:443/user/select" params:userModel.userID success:^(id  _Nullable responseObject) {
    //                    NSLog(@"%@",responseObject);
    //                    NSLog(@"%@",[NSThread currentThread]);
    //                    userModel.name = responseObject[@"User_Name"];
    //                    userModel.motto = responseObject[@"Other"];
    //                    [ZJUsersModel synchronize];
    //                } failure:^(id  _Nullable errror) {
    //                    NSLog(@"获取用户信息失败 %@",errror);
    //                } method:@"POST"];
    //    });
    //    dispatch_barrier_sync(queue, ^{
    //        model.name = userModel.name;
    //        model.motto = userModel.motto;
    //        NSLog(@"%@ %@",model.name,model.motto);
    //    });
    
    
    //    model.name = userModel.name;
    //    model.motto = userModel.motto;
    //    NSLog(@"%@ %@",model.name,model.motto);
    
    return model;
}


+(void)upDateNameMottoDataWithModel:(ZJMineHeadViewBannerModel *)model{
    ZJUsersModel *userModel = [ZJUsersModel shareInstance];
    NSDictionary *params = @{
        @"user_id":userModel.userid,
        @"name":model.name,
        @"other":model.motto
    };
    //    上传网络
    [super loadDataWithLink:@"http://47.92.93.38:443/user/changeInfo" params:params success:^(id  _Nullable responseObject) {
        NSLog(@"更新昵称和座右铭 %@",responseObject);
        //        if(responseObject[@"info"] == @"success"){
    } failure:^(id  _Nullable errror) {
        NSLog(@"更新昵称和座右铭出错 %@",errror);
    } method:@"POST"];
    
    //    更新本地
    userModel.name = model.name;
    userModel.motto = model.motto;
    [ZJUsersModel synchronize];
}

@end
