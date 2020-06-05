//
//  ZJFactory.m
//  OpenZJNG
//
//  Created by canoejun on 2019/11/6.
//

#import "ZJFactory.h"
#import "Constants.h"


@implementation ZJFactory

+(AFHTTPSessionManager *)ZJFactoryAFNManage {

    static AFHTTPSessionManager *manager;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
    });
    
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    return manager;
}



@end
