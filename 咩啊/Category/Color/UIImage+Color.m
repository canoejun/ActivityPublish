//
//  UIImage+Color.m
//  咩啊
//
//  Created by canoejun on 2020/6/5.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

+ (UIImage*)createImageWithColor:(UIColor*)color CornersSize:(float)cornerRadius{
    UIImage *image = [UIImage createImageWithColor:color];
    return [image imageWithRoundedCornersSize:cornerRadius];
}

+ (UIImage*)createImageWithColor:(UIColor*)color{
    CGRect rect=CGRectMake(0.0f,0.0f,1.0f,1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage* theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
//生成圆角UIIamge 的方法
- (UIImage *)imageWithRoundedCornersSize:(float)cornerRadius
{
    UIImage *original = self;
    CGRect frame = CGRectMake(0, 0, original.size.width, original.size.height);
    // 开始一个Image的上下文
    UIGraphicsBeginImageContextWithOptions(original.size, NO, 1.0);
    // 添加圆角
    [[UIBezierPath bezierPathWithRoundedRect:frame
                                cornerRadius:cornerRadius] addClip];
    // 绘制图片
    [original drawInRect:frame];
    // 接受绘制成功的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
