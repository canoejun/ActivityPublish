//
//  ZJBaseDataModel.h
//  咩啊
//
//  Created by canoejun on 2020/5/30.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^successBlock)(id _Nullable responseObject);
typedef void(^failureBlock)(id _Nullable errror);

NS_ASSUME_NONNULL_BEGIN

@interface ZJBaseDataModel : NSObject

+(void)loadDataWithLink:(NSString *)link params:(id _Nullable)params success:(successBlock)success failure:(failureBlock)failure method:(NSString *)method;
+(NSArray *)loadDataWith:(NSArray *)dataArray picLink:(NSString *)link;
+(ZJBaseDataModel *)loadDetailDataWithLink:(NSString *)link success:(successBlock)success failure:(failureBlock)failure;

-(instancetype)initWithDic:(NSDictionary *)dic picLink:(NSString *)link;
@end

NS_ASSUME_NONNULL_END
