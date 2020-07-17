//
//  ZJNetWorkingDefines.h
//  咩啊
//
//  Created by canoejun on 2020/6/15.
//  Copyright © 2020 canoejun. All rights reserved.
//

#ifndef ZJNetWorkingDefines_h
#define ZJNetWorkingDefines_h

@class ZJBaseAPIManager;

typedef NS_ENUM(NSUInteger, ZJAPIManagerRequestType){
    ZJAPIManagerRequestTypeGet,
    ZJAPIManagerRequestTypePost,
};

typedef NS_ENUM(NSUInteger, ZJAPIResponseStatus){
    ZJAPIResponseStatusSuccess,
    ZJAPIResponseStatusErrorTimeout,
    ZJAPIResponseStatusErrorCancel,
    ZJAPIResponseStatusErrorNoNetwork //默认除了超时以外的错误都是无网络错误。
};


@protocol ZJAPIManagerCallBackDelegate <NSObject>

-(void)manangerCallAPIDidSuccess:(id )manager;
-(void)manangerCallAPIDidFailed:(id )manager;

@end


#endif /* ZJNetWorkingDefines_h */
