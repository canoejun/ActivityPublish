//
//  ZJUsersModel.h
//  咩啊
//
//  Created by canoejun on 2020/6/5.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^loginSuccessBlock)(id _Nullable responseObject);
typedef void(^loginFailureBlock)(id _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface ZJUsersModel : NSObject
//@property (nonatomic, copy, readwrite) NSString *phoneNumber;
@property (nonatomic, copy, readwrite) NSString *userID;
//@property (nonatomic, copy, readwrite) NSString *password;

@property (nonatomic, copy, readwrite) NSString *loginInfo;

@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, copy, readwrite) NSString *motto;

+(BOOL)isLogin;
+(BOOL)logOut;
+(void)synchronize;
+(instancetype)shareInstance;
+(instancetype)shareInstanceWithDict:(NSDictionary *)dic;


+(void)userActWithLink:(NSString *)link params:(id _Nullable)params success:(loginSuccessBlock)success failure:(loginFailureBlock)failure;
@end

NS_ASSUME_NONNULL_END
