//
//  ZJUsersModel.m
//  咩啊
//
//  Created by canoejun on 2020/6/5.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJUsersModel.h"
#import "ZJNetWokingFactory.h"
#import <objc/runtime.h>

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
    model.userid = dic[@"user_id"];
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
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    Ivar ivar;
    for (int i = 0; i < count; i++) {
        ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        [coder encodeObject:[self valueForKey:key] forKey:key];
    }
    free(ivars);
}
-(instancetype)initWithCoder:(NSCoder *)coder{
    self = [super init];
    if(self){
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([self class], &count);
        Ivar ivar;
        for (int i = 0; i < count; i++) {
            ivar = ivars[i];
            const char * name = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:name];
            id value = [coder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
}

+ (BOOL)supportsSecureCoding{
    return YES;
}

@end
