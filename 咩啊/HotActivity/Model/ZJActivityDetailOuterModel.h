//
//  ZJActivityDetailOuterModel.h
//  咩啊
//
//  Created by canoejun on 2020/6/5.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJBaseDataModel.h"

@class ZJActivityDetailModel;

NS_ASSUME_NONNULL_BEGIN

@interface ZJActivityDetailOuterModel : ZJBaseDataModel

@property (nonatomic, strong, readwrite) ZJActivityDetailModel *activityDetailModel;
@property (nonatomic, copy, readwrite) NSString *userApplyState;
@property (nonatomic, copy, readwrite) NSString *userCollectState;

+(void)addCollectWithWithLink:(NSString *)link params:(id _Nullable)params success:(successBlock)success failure:(failureBlock)failure;
+(void)removeWithLink:(NSString *)link params:(id _Nullable)params success:(successBlock)success failure:(failureBlock)failure;
+(void)upLoadDataWithLink:(NSString *)link params:(id _Nullable)params success:(successBlock)success failure:(failureBlock)failure;

@end

NS_ASSUME_NONNULL_END
