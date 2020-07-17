//
//  ZJBaseDataModel.m
//  咩啊
//
//  Created by canoejun on 2020/5/30.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJBaseDataModel.h"
#import "ZJNetWokingFactory.h"
#import "ZJNetWorkingCache.h"

@implementation ZJBaseDataModel
+(void)loadDataWithLink:(NSString *)link params:(id _Nullable)params success:(successBlock)success failure:(failureBlock)failure method:(NSString *)method{
//    AFHTTPSessionManager *manager = [ZJNetWokingFactory factoryManager];
//    ZJNetWorkingCache *cache = [ZJNetWorkingCache shareInstance];
//    //    NSLog(@"%@ %@",link,params);
//    if([cache containKey:link]){
//        success([cache objectForKey:link]);
//    }
//
//    if([method isEqualToString:@"GET"]){
//        [manager GET:link parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            if (responseObject == nil){
//                NSLog(@"respondObject is null");
//                return;
//            }
//
//            //        缓存链接的数据
//            if(![cache containKey:link]){
//                [cache addObjectWithKey:link object:responseObject];
//            }
//
//            if([responseObject isKindOfClass:[NSArray class]]){
//                success(responseObject);
//            }else if ([responseObject isKindOfClass:[NSString class]]){
//                NSData *jsonData = [responseObject dataUsingEncoding:NSUTF8StringEncoding];
//                NSError *error;
//                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
//                success(dic);
//            }
//
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            failure(error);
//        }];
//    }else{
//        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//        [manager POST:link parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            success(responseObject);
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            failure(error);
//        }];
//    }
}

//+(ZJBaseDataModel *)loadDetailDataWithLink:(NSString *)link success:(successBlock)success failure:(failureBlock)failure{
//        AFHTTPSessionManager *manager = [ZJNetWokingFactory factoryManager];
//        [manager GET:[NSString stringWithFormat:@"http://47.92.93.38:443%@",link] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            success(responseObject);
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            failure(error);
//        }];
//
//    return nil;
//}



+(NSArray *)loadDataWith:(NSArray *)dataArray picLink:(nonnull NSString *)link{
    return  nil;
}
-(instancetype)initWithDic:(NSDictionary *)dic picLink:(NSString *)link{
    if(self = [super init]){
        
    }
    return self;
}
-(instancetype)initWithDic:(NSDictionary *)dic{
    if(self = [super init]){
        
    }
    return self;
}

@end
