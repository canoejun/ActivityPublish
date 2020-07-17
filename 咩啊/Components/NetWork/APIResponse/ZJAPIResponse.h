//
//  ZJAPIResponse.h
//  咩啊
//
//  Created by canoejun on 2020/6/15.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJNetWorkingDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZJAPIResponse : NSObject
@property (nonatomic, assign, readonly) ZJAPIResponseStatus status;



@end

NS_ASSUME_NONNULL_END
