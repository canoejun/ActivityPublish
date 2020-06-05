//
//  ZJAboutHeaderView.m
//  OpenZJNG
//
//  Created by 张俊 on 2019/2/20.
//

#import "ZJAboutHeaderView.h"

@implementation ZJAboutHeaderView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setUpUI];
    }
    return self;
}

-(void)setUpUI {
//    添加图片
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    imageView.frame = CGRectMake(0, 60, 120, 120);
    imageView.center = CGPointMake(self.center.x, imageView.center.y);
    [self addSubview:imageView];
//    添加label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), 200, 50)];
    label.center = CGPointMake(self.center.x, label.center.y);
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"西大助手\nVersion. 2.0.0";
    [self addSubview:label];
    
    CGFloat maxY = CGRectGetMaxY(label.frame);
    self.frame = CGRectMake(0, 0, self.frame.size.width, maxY + 40);
}

@end
