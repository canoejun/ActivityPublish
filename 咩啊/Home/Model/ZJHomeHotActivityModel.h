//
//  ZJHomeHotActivityModel.h
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJHomeHotActivityModel : NSObject
@property (nonatomic, copy, readwrite) NSString *title;
@property (nonatomic, copy, readwrite) NSString *detailTitle;

+(NSArray *)loadData;
-(instancetype)initWithDic:(NSDictionary *)dic;
@end

NS_ASSUME_NONNULL_END
