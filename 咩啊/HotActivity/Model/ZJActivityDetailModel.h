//
//  ZJActivityDetailModel.h
//  咩啊
//
//  Created by canoejun on 2020/5/29.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <Foundation/Foundation.h>



NS_ASSUME_NONNULL_BEGIN

@interface ZJActivityDetailModel : NSObject


@property (nonatomic, copy, readwrite) NSString *ActivityID;
@property (nonatomic, copy, readwrite) NSString *OgnName;
@property (nonatomic, copy, readwrite) NSString *OgnIcon;
@property (nonatomic, copy, readwrite) NSString *Title;
@property (nonatomic, copy, readwrite) NSString *Time;
@property (nonatomic, copy, readwrite) NSString *BeginTime;
@property (nonatomic, copy, readwrite) NSString *EndTime;
@property (nonatomic, copy, readwrite) NSString *ActivityState;
@property (nonatomic, copy, readwrite) NSString *Content;
@property (nonatomic, copy, readwrite) NSString *ReadQuantity;
@property (nonatomic, copy, readwrite) NSString *TotalQuantity;
@property (nonatomic, copy, readwrite) NSString *ApplyQuantity;
@property (nonatomic, copy, readwrite) NSString *SignBeginTime;
@property (nonatomic, copy, readwrite) NSString *SignEndTime;
@property (nonatomic, copy, readwrite) NSString *Post;
@property (nonatomic, copy, readwrite) NSString *Position;
@property (nonatomic, copy, readwrite) NSString *PublishTime;


//"ActivityID": 1,
//"OgnName": "西南大学棋艺协会",
//"OgnIcon": "/images/8.jpg",
//"Title": "棋艺大赛",
//"Time": "2019年06月04日 - 星期二",
//"BeginTime": "14:30",
//"EndTime": "17:00",
//"ActivityState": 1,
//"Content": "棋艺大赛具体详情，请加棋艺大赛咨询群：604676912",
//"ReadQuantity": 20,
//"TotalQuantity": 11,
//"ApplyQuantity": 1,
//"SignBeginTime": "14:00",
//"SignEndTime": "14:30",
//"Post": "/images/1.jpg",
//"Position": "西南大学第四运动场",
//"PublishTime": "20:53"

//+(instancetype)loadDataWithLink:(NSString *)url;

-(instancetype)initWithDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
