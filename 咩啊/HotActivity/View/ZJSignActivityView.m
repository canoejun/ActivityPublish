//
//  ZJSignActivityView.m
//  咩啊
//
//  Created by canoejun on 2020/5/30.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJSignActivityView.h"
#import "ZJSignActivityModuleView.h"
#import "ZJUsersModel.h"
#import "SVProgressHUD/SVProgressHUD.h"
#import "ZJActivityDetailOuterModel.h"

@interface ZJSignActivityView ()<UITextFieldDelegate>
@property (nonatomic, strong, readwrite) UITextField *selectTextField;

@property (nonatomic, strong, readwrite) ZJSignActivityModuleView *nameView;
@property (nonatomic, strong, readwrite) ZJSignActivityModuleView *numberView;
@property (nonatomic, strong, readwrite) ZJSignActivityModuleView *noteView;
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
    
    ZJSignActivityModuleView *nameView = [[ZJSignActivityModuleView alloc] initTextFieldWithFrame:CGRectMake(left, 135, width, height) title:@"姓名" placeText:@"请输入你的姓名"];
    self.nameView = nameView;
    nameView.textFiled.delegate = self;
    [self addSubview:nameView];
    //    添加手机号
    ZJSignActivityModuleView *numberView = [[ZJSignActivityModuleView alloc] initTextFieldWithFrame:CGRectMake(left, CGRectGetMaxY(nameView.frame), width, height) title:@"手机号" placeText:@"请输入你的手机号"];
    self.numberView = numberView;
    numberView.textFiled.keyboardType = UIKeyboardTypeNumberPad;
    numberView.textFiled.delegate = self;
    [self addSubview:numberView];
    
    //添加备注
    ZJSignActivityModuleView *noteView = [[ZJSignActivityModuleView alloc] initTextFieldWithFrame:CGRectMake(left, CGRectGetMaxY(numberView.frame), width, height) title:@"备注" placeText:@"请输入备注"];
    self.noteView = noteView;
    noteView.textFiled.delegate = self;
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
    
    if (_nameView.textFiled.text.length <= 0 && _numberView.textFiled.text.length <= 0) {
        [SVProgressHUD showErrorWithStatus:@"请填写姓名和手机号"];
        return ;
    }
    if (![self checkPhoneNumber:_numberView.textFiled.text]) {
        [SVProgressHUD showErrorWithStatus:@"请检查手机号"];
        return;
    }
    
    
    //    /apply/create
    NSDictionary *params = @{
        @"user_id":[ZJUsersModel shareInstance].userid,
        @"activity_id":_currentActivityID,
        @"name":[NSString stringWithFormat:@"%@",_nameView.textFiled.text],
        @"phone":[NSString stringWithFormat:@"%@",_numberView.textFiled.text],
        @"other":[NSString stringWithFormat:@"%@",_noteView.textFiled.text]
    };
    dispatch_queue_t queue = dispatch_queue_create("signQueue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(queue, ^{
        [SVProgressHUD showProgress:30 status:@"报名中～～"];
        [ZJActivityDetailOuterModel upLoadDataWithLink:@"http://47.92.93.38:443/apply/create" params:params success:^(id  _Nullable responseObject) {
            [SVProgressHUD showSuccessWithStatus:@"报名成功"];
            if([self.delegate respondsToSelector:@selector(popViewController)]){
                [self.delegate popViewController];
            }
        } failure:^(id  _Nullable errror) {
            [SVProgressHUD showErrorWithStatus:@"报名失败！请重试"];
            NSLog(@"%@",errror);
        }];
    });
    
    [self.signBtn setBackgroundColor:[UIColor colorWithRed:255/255.0 green:57/255.0 blue:56/255.0 alpha:1.0]];
    self.signBtn.selected = YES;
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.selectTextField = textField;
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.selectTextField resignFirstResponder];
}

- (BOOL)checkPhoneNumber:(NSString *)phoneNumber
{
    NSString *regex = @"^[1][3-8]\\d{9}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:phoneNumber];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

    if (textField == _numberView.textFiled && range.location >= 11) {
        return NO;
    }
    return YES;
}
@end
