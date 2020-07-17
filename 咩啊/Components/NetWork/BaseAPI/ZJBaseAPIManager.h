//
//  ZJBaseAPIManager.h
//  咩啊
//
//  Created by canoejun on 2020/6/15.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJNetWorkingDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZJBaseAPIManager : NSObject
@property (nonatomic, weak, readwrite) id<ZJAPIManagerCallBackDelegate> delegate;
// start
//+ (void)loadDataWithParams:(NSDictionary * _Nullable)params success:(void (^ _Nullable)(ZJBaseAPIManager * _Nonnull apiManager))successCallback fail:(void (^ _Nullable)(ZJBaseAPIManager * _Nonnull apiManager))failCallback;
+ (void)loadDataWithRequestMethod:(ZJAPIManagerRequestType)method dataLink:(NSString *)link params:(NSDictionary * _Nullable)params;
@end

NS_ASSUME_NONNULL_END
