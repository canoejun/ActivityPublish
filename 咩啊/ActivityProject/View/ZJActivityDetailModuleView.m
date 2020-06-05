//
//  ZJActivityDetailModuleView.m
//  咩啊
//
//  Created by canoejun on 2020/6/4.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJActivityDetailModuleView.h"

@implementation ZJActivityDetailModuleView

-(UIView *)initWithFrame:(CGRect)frame  text1:(NSString *)text1;{
    self = [super initWithFrame:frame];
    if (self) {
        self.detailLable = [self __buildLabelWithFrame:CGRectMake(0, 0, frame.size.width, 20) text:@"" font:[UIFont fontWithName:@"PingFang SC" size: 16] textColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0] sizetoFit:NO];
        _detailLable.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_detailLable];
         
        UILabel *label2 = [self __buildLabelWithFrame:CGRectMake(0, CGRectGetMaxY(_detailLable.frame), frame.size.width, 20) text:text1 font:[UIFont fontWithName:@"PingFang SC" size: 16] textColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] sizetoFit:NO];
        label2.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label2];
    }
    return self;
}


-(UILabel *)__buildLabelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor sizetoFit:(BOOL)flag{
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:frame];
    titleLabel.text = text;
    titleLabel.numberOfLines = 0;
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = [UIColor blackColor];
    if(font){
        titleLabel.font = font;
    }
    if (textColor) {
        titleLabel.textColor = textColor;
    }
    
    if (flag) {
        CGFloat width = titleLabel.frame.size.width;     //width : UILable的宽度
        CGSize size = CGSizeMake(width, MAXFLOAT);
        CGSize textRealSize;
        textRealSize = [titleLabel.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin     attributes:@{NSFontAttributeName:font} context:nil].size;
         //改变高度
         CGRect rect = titleLabel.frame;
         rect.size.height = textRealSize.height;
         titleLabel.frame = rect;
    }

    return titleLabel;
}
@end
