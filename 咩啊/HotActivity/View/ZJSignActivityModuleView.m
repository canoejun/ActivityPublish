//
//  ZJSignActivityModuleView.m
//  咩啊
//
//  Created by canoejun on 2020/6/5.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJSignActivityModuleView.h"

@interface ZJSignActivityModuleView ()

@end

@implementation ZJSignActivityModuleView


-(instancetype)initTextFieldWithFrame:(CGRect)frame title:(NSString *)title placeText:(NSString *)placeText{
    if(self = [super initWithFrame:frame]){
        [self __buildTextFieldWithFrame:frame title:title placeText:placeText];
    }
    return self;
}

-(void)__buildTextFieldWithFrame:(CGRect)frame title:(NSString *)title placeText:(NSString *)placeText{
    CGFloat width = frame.size.width;
    
//    添加标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 25)];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:title attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 21],NSForegroundColorAttributeName: [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]}];
    titleLabel.attributedText = string;
    [self addSubview:titleLabel];
    
//    添加文本框
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLabel.frame)+10, width, 35)];
    self.textFiled = textField;
    textField.placeholder = placeText;
    [self addSubview:textField];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(textField.frame)+10, width, 1)];
    lineView.alpha = 0.6;
    lineView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:lineView];
}


@end
