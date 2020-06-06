//
//  UIImage+Color.h
//  咩啊
//
//  Created by canoejun on 2020/6/5.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Color)
+ (UIImage*)createImageWithColor:(UIColor*)color CornersSize:(float)cornerRadius;
@end

NS_ASSUME_NONNULL_END
