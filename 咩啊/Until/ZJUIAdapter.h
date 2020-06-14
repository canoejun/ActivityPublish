//
//  ZJUIAdapter.h
//  咩啊
//
//  Created by canoejun on 2020/6/12.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IS_LANDSPACE (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))

#define SCREEN_WIDTH (IS_LANDSPACE ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width)
#define SCREEN_Height (IS_LANDSPACE ? [UIScreen mainScreen].bounds.size.width : [UIScreen mainScreen].bounds.size.height)

static inline NSInteger UIAdapter (CGFloat x){
    CGFloat ratio = 414 / SCREEN_WIDTH;
    return  (NSInteger)x / ratio;
}

static inline CGRect UIRectAdapter(CGFloat x,CGFloat y,CGFloat width,CGFloat height){
    return CGRectMake(UIAdapter(x), UIAdapter(y), UIAdapter(width), UIAdapter(height));
}

NS_ASSUME_NONNULL_BEGIN

@interface ZJUIAdapter : NSObject

@end

NS_ASSUME_NONNULL_END
