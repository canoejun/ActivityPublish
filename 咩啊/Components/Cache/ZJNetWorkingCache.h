//
//  ZJNetWorkingCache.h
//  咩啊
//
//  Created by canoejun on 2020/6/4.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJNetWorkingDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZJNetWorkingCache : NSDictionary
+(instancetype)shareInstance;

-(void)clearAll;
//-(void)addObjectWithKey:(id)key object:(id)object;
-(void)saveCachWithResponse:(id)response  forLink:(NSString *)link methodName:(ZJAPIManagerRequestType)methodName params:(NSDictionary *)params;

//-(BOOL)containResponseWithLink:(NSString *)link methodName:(NSString *)methodName params:(NSDictionary *)params;

-(id)getResponseWithLink:(NSString *)link methodName:(ZJAPIManagerRequestType)methodName params:(NSDictionary *)params;
//-(void)updateObjectWithKey:(id)key object:(id)object;
-(void)removeRespondLink:(NSString *)link methodName:(ZJAPIManagerRequestType)methodName params:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
