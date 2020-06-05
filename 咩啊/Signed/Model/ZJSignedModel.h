//
//  ZJSignedModel.h
//  咩啊
//
//  Created by canoejun on 2020/5/23.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJBaseDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZJSignedModel : ZJBaseDataModel
@property (nonatomic, copy, readwrite) NSString *title;

@property (nonatomic, copy, readwrite) NSString *location;

@property (nonatomic, copy, readwrite) NSString *time;

@property (nonatomic, copy, readwrite) NSString *imageUrl;

@property (nonatomic, copy, readwrite) NSString *activityID;

//+(NSArray *)loadSignedData;

//"Activity_ID": 1,
//"Title": "棋艺大赛",
//"Begin_time": "2019年06月04日 - 星期二",
//"Post": "/images/1.jpg",
//"Position": "西南大学第四运动场"
@end

NS_ASSUME_NONNULL_END
