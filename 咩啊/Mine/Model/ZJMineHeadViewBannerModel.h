//
//  ZJMineHeadViewBannerModel.h
//  咩啊
//
//  Created by canoejun on 2020/5/30.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJMineHeadViewBannerModel : NSObject
@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, copy, readwrite) NSString *motto;

+(instancetype)loadDataWithLink:(NSString *)nameLink mottoLink:(NSString *)mottoLink;

@end

NS_ASSUME_NONNULL_END
