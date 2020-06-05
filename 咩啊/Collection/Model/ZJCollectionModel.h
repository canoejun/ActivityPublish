//
//  ZJCollectionModel.h
//  咩啊
//
//  Created by canoejun on 2020/5/24.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJBaseDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZJCollectionModel : ZJBaseDataModel

//图片地址
@property (nonatomic, copy, readwrite) NSString *imgUrl;

//文字
@property (nonatomic, copy, readwrite) NSString *content;

@property (nonatomic, copy, readwrite) NSString *activityID;

@property (nonatomic, copy, readwrite) NSString *activityState;

//按钮的选中状态
@property (nonatomic, assign, readwrite, getter=isSelected) BOOL selected;


+(NSArray *)loadCollectionData;

//-(instancetype)initWithDic:(NSDictionary *)dic;

+(void)removeDataWithLink:(NSString *)link params:(id _Nullable)params success:(successBlock)success failure:(failureBlock)failure;


@end

NS_ASSUME_NONNULL_END
