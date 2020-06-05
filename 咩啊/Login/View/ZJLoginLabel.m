//
//  ZJLoginLabel.m
//  OpenZJNG
//
//  Created by 张俊 on 2019/3/2.
//

#import "ZJLoginLabel.h"
#import "Constants.h"

@implementation ZJLoginLabel
+(ZJLoginLabel *)ZJLoginLabelwithText:(NSString *)text {
    ZJLoginLabel * label = [[ZJLoginLabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH*0.2, WEEK_SCROLLERVIEW_HEIGHT)];
    label.textAlignment = NSTextAlignmentRight;
    label.text = text;
    return label;
}

@end
