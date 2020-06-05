//
//  ZJSignActivityView.m
//  咩啊
//
//  Created by canoejun on 2020/5/30.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJSignActivityView.h"

@interface ZJSignActivityView ()<UITextFieldDelegate>
@property (nonatomic, strong, readwrite) UITextField *selectTextField;
@end

@implementation ZJSignActivityView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor whiteColor];
        [self __setUI];
    }
    return self;
}


-(void)__setUI{
//   添加姓名
    CGFloat left = 45;
    CGFloat height = 100;
    CGFloat width = self.frame.size.width - 2*left;
    
    UIView *nameView = [self __buildTextFieldWithFrame:CGRectMake(left, 135, width, height) title:@"姓名" placeText:@"请输入你的姓名"];
    [self addSubview:nameView];
//    添加手机号
    UIView *numberView = [self __buildTextFieldWithFrame:CGRectMake(left, CGRectGetMaxY(nameView.frame), width, height) title:@"手机号" placeText:@"请输入你的手机号"];
    [self addSubview:numberView];
    
//添加备注
    UIView *noteView = [self __buildTextFieldWithFrame:CGRectMake(left, CGRectGetMaxY(numberView.frame), width, height) title:@"备注" placeText:@"请输入备注"];
    [self addSubview:noteView];
    
//    添加报名的按钮
    UIButton *signBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [signBtn setBackgroundColor:[UIColor colorWithRed:255/255.0 green:210/255.0 blue:0/255.0 alpha:1.0]];
    [signBtn setTitle:@"确定" forState:UIControlStateNormal];
    [signBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    signBtn.frame = CGRectMake(0, CGRectGetMaxY(noteView.frame) + 80, width, 55);
    signBtn.center = CGPointMake(self.center.x, signBtn.center.y);
    signBtn.layer.shadowColor = [UIColor colorWithRed:255/255.0 green:210/255.0 blue:0/255.0 alpha:0.1].CGColor;
    signBtn.layer.cornerRadius = signBtn.frame.size.height * 0.5;
    [signBtn addTarget:self action:@selector(__signBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:signBtn];
    
}

-(void)__signBtnDidClicked{
//    上传网络
    NSLog(@"%s",__func__);
}

-(UIView *)__buildTextFieldWithFrame:(CGRect)frame title:(NSString *)title placeText:(NSString *)placeText{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    
    CGFloat width = frame.size.width;
    
//    添加标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 25)];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:title attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 21],NSForegroundColorAttributeName: [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]}];
    titleLabel.attributedText = string;
    [view addSubview:titleLabel];
    
//    添加文本框
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLabel.frame)+10, width, 35)];
    textField.placeholder = placeText;
    textField.delegate = self;
    [view addSubview:textField];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(textField.frame)+10, width, 1)];
    lineView.alpha = 0.6;
    lineView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:lineView];
    
    return view;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.selectTextField = textField;
    [self becomeFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.selectTextField resignFirstResponder];
}
@end
