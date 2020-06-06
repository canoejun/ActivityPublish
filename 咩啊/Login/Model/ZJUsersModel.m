//
//  ZJUsersModel.m
//  咩啊
//
//  Created by canoejun on 2020/6/5.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJUsersModel.h"
//#import "ZJBaseDataModel.h"
#import "ZJFactory.h"

#define kEncodedObjectPath_User ([[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"user"])

@interface ZJUsersModel ()<NSSecureCoding>

@end

@implementation ZJUsersModel

+(BOOL)isLogin{
    NSFileManager *manager = [NSFileManager defaultManager];
    return [manager fileExistsAtPath:kEncodedObjectPath_User];
}
+(BOOL)logOut{
    NSFileManager *manager = [NSFileManager defaultManager];
    NSError *error;
    return [manager removeItemAtPath:kEncodedObjectPath_User error:&error];
}
+(void)synchronize{
    NSError *error;
    NSData *archiverData = [NSKeyedArchiver archivedDataWithRootObject:[ZJUsersModel shareInstance] requiringSecureCoding:YES error:&error];
    [archiverData writeToFile:kEncodedObjectPath_User atomically:YES];
}
+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    static ZJUsersModel *model = nil;
    dispatch_once(&onceToken, ^{
        if([ZJUsersModel isLogin]){
            NSData *oldData = [NSData dataWithContentsOfFile:kEncodedObjectPath_User];
            NSError *error;
            model = [NSKeyedUnarchiver unarchivedObjectOfClass:[ZJUsersModel class] fromData:oldData error:&error];
        }else{
            model = [[ZJUsersModel alloc] init];
        }
    });
    return model;
}

+(instancetype)shareInstanceWithDict:(NSDictionary *)dic{
    ZJUsersModel *model = [ZJUsersModel shareInstance];
    model.userID = dic[@"user_id"];
    model.loginInfo = dic[@"info"];
    return model;
}


+(void)userActWithLink:(NSString *)link params:(id _Nullable)params success:(loginSuccessBlock)success failure:(loginFailureBlock)failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    NSLog(@"%@ %@",link,params);
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager POST:link parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject);
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}


- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.userID forKey:@"userid"];
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.motto forKey:@"motto"];
}
-(instancetype)initWithCoder:(NSCoder *)coder{
    if(self = [super init]){
        self.userID = [coder decodeObjectForKey:@"userid"];
        self.name = [coder decodeObjectForKey:@"name"];
        self.motto = [coder decodeObjectForKey:@"motto"];
    }
    return self;
}

+ (BOOL)supportsSecureCoding{
    return YES;
}

@end
