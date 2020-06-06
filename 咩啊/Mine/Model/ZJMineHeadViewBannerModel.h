//
//  ZJMineHeadViewBannerModel.h
//  咩啊
//
//  Created by canoejun on 2020/5/30.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJBaseDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZJMineHeadViewBannerModel : ZJBaseDataModel
@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, copy, readwrite) NSString *motto;

+(void)loadNameMottoData:(void(^)(ZJMineHeadViewBannerModel *model))block;
+(void)upDateNameMottoDataWithModel:(ZJMineHeadViewBannerModel *)model;
@end

NS_ASSUME_NONNULL_END
