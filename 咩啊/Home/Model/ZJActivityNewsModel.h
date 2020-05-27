//
//  ZJActivityNewsModel.h
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJActivityNewsModel : NSObject
@property (nonatomic, copy, readwrite) NSString *title;
//举办单位
@property (nonatomic, copy, readwrite) NSString *hostUnit;
//参加的人数
@property (nonatomic, copy, readwrite) NSString *joinPeopleCount;
//活动图片
@property (nonatomic, copy, readwrite) NSString *activityImageUrl;
//小图标
@property (nonatomic, copy, readwrite) NSString *littleImageUrl;
+(NSArray *)loadData;
-(instancetype)initWithDic:(NSDictionary *)dic;
@end

NS_ASSUME_NONNULL_END
