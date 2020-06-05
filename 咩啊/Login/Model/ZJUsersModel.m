//
//  ZJUsersModel.m
//  咩啊
//
//  Created by canoejun on 2020/6/5.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJUsersModel.h"

#define kEncodedObjectPath_User ([[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"user"])

@interface ZJUsersModel ()<NSSecureCoding>

@end

@implementation ZJUsersModel

+(BOOL)isLogin{
    NSFileManager *manager = [NSFileManager defaultManager];
    return [manager fileExistsAtPath:kEncodedObjectPath_User];
}
+(BOOL)loginOut{
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


- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.phoneNumber forKey:@"phoneNumber"];
    [coder encodeObject:self.password forKey:@"password"];
}
-(instancetype)initWithCoder:(NSCoder *)coder{
    if(self = [super init]){
        self.phoneNumber = [coder decodeObjectForKey:@"phoneNumber"];
        self.password = [coder decodeObjectForKey:@"password"];
    }
    return self;
}

+ (BOOL)supportsSecureCoding{
    return YES;
}

@end
