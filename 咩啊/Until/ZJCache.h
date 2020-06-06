//
//  ZJCache.h
//  咩啊
//
//  Created by canoejun on 2020/6/4.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJCache : NSDictionary
+(instancetype)shareInstance;
-(void)clearAll;
-(void)addObjectWithKey:(id)key object:(id)object;
-(BOOL)containKey:(id)key;
-(id)objectForKey:(id)key;
-(void)updateObjectWithKey:(id)key object:(id)object;
-(void)removeObjectWithKey:(id)key;
@end

NS_ASSUME_NONNULL_END
