//
//  ZJBaseAPIManager.m
//  咩啊
//
//  Created by canoejun on 2020/6/15.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJBaseAPIManager.h"
#import "ZJNetWokingFactory.h"
#import "ZJNetWorkingCache.h"


@interface ZJBaseAPIManager ()
@property (nonatomic, strong, readwrite) void(^successBlock)(ZJBaseAPIManager *apiManager);
@property (nonatomic, strong, readwrite) void(^failBlock)(ZJBaseAPIManager *apiManager);
@end

@implementation ZJBaseAPIManager

#pragma mark ---------------------public method------------------------------
+ (void)loadDataWithRequestMethod:(ZJAPIManagerRequestType)method dataLink:(NSString *)link params:(NSDictionary * _Nullable)params{
    [[[ZJBaseAPIManager alloc] init] loadDataWithRequestMethod:method dataLink:link params:params];
}




#pragma mark ---------------------private method------------------------------
- (void)loadDataWithRequestMethod:(ZJAPIManagerRequestType)method dataLink:(NSString *)link params:(NSDictionary * _Nullable)params;{
    
    AFHTTPSessionManager *manager = [ZJNetWokingFactory factoryManager];
    ZJNetWorkingCache *cache = [ZJNetWorkingCache shareInstance];
    id respond = [cache getResponseWithLink:link methodName:method params:params];
    if(respond){
        [self successedOnCallingAPI:respond];
    }
    __weak typeof(self) weakSelf = self;
    switch (method) {
        case ZJAPIManagerRequestTypeGet:{
            [manager GET:link parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (responseObject == nil){
                    NSLog(@"respondObject is null");
                    return;
                }
                [weakSelf successedOnCallingAPI:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [weakSelf failedOnCallingAPI:error];
            }];
            break;
        }
        case ZJAPIManagerRequestTypePost:{
            manager.requestSerializer = [AFHTTPRequestSerializer serializer];
            [manager POST:link parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                 [weakSelf successedOnCallingAPI:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [weakSelf failedOnCallingAPI:error];
            }];
            break;
        }
        default:
            break;
    }
    
}

- (void)successedOnCallingAPI:(id _Nullable)response{
    if([self.delegate respondsToSelector:@selector(manangerCallAPIDidSuccess:)]){
        [self.delegate manangerCallAPIDidSuccess:response];
    }
}
- (void)failedOnCallingAPI:(id _Nullable)error{
//    判断一下返回的错误类型是什么
    if([self.delegate respondsToSelector:@selector(manangerCallAPIDidFailed:)]){
        [self.delegate manangerCallAPIDidFailed:error];
    }
}



@end
