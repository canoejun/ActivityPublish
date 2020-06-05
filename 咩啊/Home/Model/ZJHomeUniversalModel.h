//
//  ZJActivityNewsModel.h
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJBaseDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZJHomeUniversalModel : ZJBaseDataModel

@property (nonatomic, copy, readwrite) NSString *title;
//举办单位
@property (nonatomic, copy, readwrite) NSString *hostUnit;
//参加的人数
@property (nonatomic, copy, readwrite) NSString *joinPeopleCount;
//活动图片
@property (nonatomic, copy, readwrite) NSString *activityImageUrl;
//小图标
@property (nonatomic, copy, readwrite) NSString *hostIconUrl;

@property (nonatomic, copy, readwrite) NSString *activityID;

@property (nonatomic, copy, readwrite) NSString *activityState;



//{
//    "Activity_ID": 4,
//    "Title": "社团嘉年华",
//    "Ogn": "西南大学学生社团联合会",
//    "Ogn_icon": "/images/7.jpg",
//    "Apply": 6,
//    "Post": "/images/2.jpg",
//    "Activity_State": 2
//},


//+(NSArray *)loadData;
//+(NSArray *)loadData1;
//+(NSArray *)loadDataWith:(NSArray *)dataArray;
+(void)loadDataWithLink:(NSString *)link success:(successBlock)success failure:(failureBlock)failure;
@end

NS_ASSUME_NONNULL_END
