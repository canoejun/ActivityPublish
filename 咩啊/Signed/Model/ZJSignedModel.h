//
//  ZJSignedModel.h
//  咩啊
//
//  Created by canoejun on 2020/5/23.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJSignedModel : NSObject
@property (nonatomic, copy, readwrite) NSString *title;

@property (nonatomic, copy, readwrite) NSString *location;

@property (nonatomic, copy, readwrite) NSString *time;

@property (nonatomic, copy, readwrite) NSString *imageUrl;

+(NSArray *)loadSignedData;
@end

NS_ASSUME_NONNULL_END
