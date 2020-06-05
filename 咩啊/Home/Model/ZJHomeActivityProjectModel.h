//
//  ZJActivityProjectModel.h
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJBaseDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZJHomeActivityProjectModel : ZJBaseDataModel
/**Class_ID */
@property (nonatomic, copy, readwrite) NSString *ClassID;
/** Class_Name*/
@property (nonatomic, copy, readwrite) NSString *ClassName;
/***/
@property (nonatomic, copy, readwrite) NSString *ClassBeginTime;
/***/
@property (nonatomic, copy, readwrite) NSString *ClassEndTime;
/** 活动的状态*/
@property (nonatomic, copy, readwrite) NSString *ClassState;
/** Class_Post 图片*/
@property (nonatomic, copy, readwrite) NSString *ClassImageUrl;


//"Class_ID": 2,
//"Class_Name": "忆物",
//"Class_Begin_Time": "2019.05.16",
//"Class_End_Time": "2019.06.01",
//"Class_State": 0,
//"Class_Post": "/images/10.jpg"


//+(NSArray *)loadData;
+(void)loadDataWithLink:(NSString *)link success:(successBlock)success failure:(failureBlock)failure;
@end

NS_ASSUME_NONNULL_END
