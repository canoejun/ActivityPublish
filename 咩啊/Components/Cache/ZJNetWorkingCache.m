//
//  ZJNetWorkingCache.m
//  咩啊
//
//  Created by canoejun on 2020/6/4.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJNetWorkingCache.h"


@interface ZJNetWorkingCache ()
@property (nonatomic, strong, readwrite) NSMutableDictionary *dataDic;
@end

@implementation ZJNetWorkingCache

+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    static ZJNetWorkingCache *instance;
    dispatch_once(&onceToken, ^{
        instance = [[ZJNetWorkingCache alloc] init];
    });
    return instance;
}
-(void)clearAll{
    [self.dataDic removeAllObjects];
}

-(void)saveCachWithResponse:(id)response  forLink:(NSString *)link methodName:(ZJAPIManagerRequestType)methodName params:(NSDictionary *)params{
    NSString *key = [self getUniveralLinkWithLink:link methodName:methodName params:params];
    [self addObjectWithKey:key object:response];
}


-(id)getResponseWithLink:(NSString *)link methodName:(ZJAPIManagerRequestType)methodName params:(NSDictionary *)params{
    NSString *key = [self getUniveralLinkWithLink:link methodName:methodName params:params];
    if(![self containKey:key]){
        return nil;
    }
    return [self objectForKey:key];;
}

-(void)removeRespondLink:(NSString *)link methodName:(ZJAPIManagerRequestType)methodName params:(NSDictionary *)params{
    NSString *key = [self getUniveralLinkWithLink:link methodName:methodName params:params];
    [self removeObjectWithKey:key];
}

#pragma mark ---------------------private method------------------------------
-(NSString *)getUniveralLinkWithLink:(NSString *)link methodName:(ZJAPIManagerRequestType)methodName params:(NSDictionary *)params{
    return [NSString stringWithFormat:@"%@%lu%@",link,(unsigned long)methodName,params];
}

-(void)addObjectWithKey:(NSString *)key object:(id)object{
    [self.dataDic setObject:object forKey:key];
}
-(BOOL)containKey:(id)key{
    if([self.dataDic.allKeys containsObject:key]){
        return YES;
    }
    return NO;
    
}
-(void)updateObjectWithKey:(id)key object:(id)object{
    self.dataDic[key] = object;
}

-(void)removeObjectWithKey:(id)key{
    [self.dataDic removeObjectForKey:key];
}

-(id)objectForKey:(id)key{
    if([self containKey:key]){
        return nil;
    }
    return [self.dataDic objectForKey:key];
}

-(NSMutableDictionary *)dataDic{
    if(!_dataDic){
        _dataDic = [NSMutableDictionary dictionary];
    }
    return _dataDic;
}
@end
