//
//  ZJUsersModel.h
//  咩啊
//
//  Created by canoejun on 2020/6/5.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJUsersModel : NSObject
@property (nonatomic, copy, readwrite) NSString *phoneNumber;

@property (nonatomic, copy, readwrite) NSString *password;

+(BOOL)isLogin;
+(BOOL)loginOut;
+(void)synchronize;
+(instancetype)shareInstance;

@end

NS_ASSUME_NONNULL_END
