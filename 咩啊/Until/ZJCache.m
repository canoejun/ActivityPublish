//
//  ZJCache.m
//  咩啊
//
//  Created by canoejun on 2020/6/4.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJCache.h"

@interface ZJCache ()
@property (nonatomic, strong, readwrite) NSMutableDictionary *dataDic;
@end

@implementation ZJCache

+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    static ZJCache *instance;
    dispatch_once(&onceToken, ^{
        instance = [[ZJCache alloc] init];
    });
    return instance;
}

-(void)clearAll{
    [self.dataDic removeAllObjects];
}
-(void)addObjectWithKey:(id)key object:(id)object{
    [self.dataDic setObject:object forKey:key];
}
-(BOOL)containKey:(id)key{
    if([self.dataDic.allKeys containsObject:key]){
        return YES;
    }
    return NO;
    
}
-(void)updateObjectWithKey:(id)key object:(id)object{
    
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
