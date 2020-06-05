//
//  ZJMineNameMottoModel.h
//  咩啊
//
//  Created by canoejun on 2020/5/30.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZJMineHeadViewBannerModel;

NS_ASSUME_NONNULL_BEGIN

@interface ZJMineNameMottoModel : NSObject
@property (nonatomic, copy, readwrite) NSString *content;
@property (nonatomic, copy, readwrite) NSString *remind;

+(NSArray *)loadDataWithModel:(ZJMineHeadViewBannerModel *)model;
@end

NS_ASSUME_NONNULL_END
