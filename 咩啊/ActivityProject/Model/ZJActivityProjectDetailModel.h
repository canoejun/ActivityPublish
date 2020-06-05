//
//  ZJActivityProjectDetailModel.h
//  咩啊
//
//  Created by canoejun on 2020/5/29.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJBaseDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZJActivityProjectDetailModel : ZJBaseDataModel

@property (nonatomic, copy, readwrite) NSString *ClassID;
@property (nonatomic, copy, readwrite) NSString *ClassName;
@property (nonatomic, copy, readwrite) NSString *ClassContent;
@property (nonatomic, copy, readwrite) NSString *ClassReadQuantity;
@property (nonatomic, copy, readwrite) NSString *ClassApplyQuantity;
@property (nonatomic, copy, readwrite) NSString *ClassBeginTime;
@property (nonatomic, copy, readwrite) NSString *ClassEndTime;
@property (nonatomic, copy, readwrite) NSString *ClassState;
@property (nonatomic, copy, readwrite) NSString *ClassPost;



//"ClassID": 2,
//"ClassName": "忆物",
//"ClassContent": "有时候\r\n记忆的存储需要一个载体",
//"ClassReadQuantity": 171,
//"ClassApplyQuantity": 80,
//"ClassBeginTime": "2019.05.16",
//"ClassEndTime": "2019.06.01",
//"ClassState": 0,
//"ClassPost": "/images/10.jpg"

-(instancetype)initWithDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
