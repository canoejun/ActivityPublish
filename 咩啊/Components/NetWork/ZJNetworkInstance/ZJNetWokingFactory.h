//
//  ZJNetWokingFactory.h
//  OpenZJNG
//
//  Created by canoejun on 2019/11/6.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


NS_ASSUME_NONNULL_BEGIN

@interface ZJNetWokingFactory : NSObject


+(AFHTTPSessionManager *)factoryManager;

@end

NS_ASSUME_NONNULL_END
