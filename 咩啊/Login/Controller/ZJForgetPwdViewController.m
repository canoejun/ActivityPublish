//
//  ZJForgetPwdViewController.m
//  OpenZJNG
//
//  Created by 张俊 on 2019/3/1.
//

#import "ZJForgetPwdViewController.h"
#import "Constants.h"
#import "UIButton+Login.h"
#import "ZJTextField.h"
#import "ZJLoginLabel.h"
#import "SVProgressHUD/SVProgressHUD.h"
#import "ZJUsersModel.h"

@interface ZJForgetPwdViewController ()
/** 手机号  */
@property (nonatomic,strong) ZJTextField * userPhoneNumber;
/** 第一次密码  */
@property (nonatomic,strong) ZJTextField * firstPwd;
/** 第二次密码  */
@property (nonatomic,strong) ZJTextField * secondPwd;
/** 确认修改密码  */
@property (nonatomic,strong) UIButton * confirmBtn;

@end

@implementation ZJForgetPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"忘记密码";

}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    [self setUpUI];
}

-(void)setUpUI {
    self.view.backgroundColor = [UIColor whiteColor];
    //    绑定校园卡
    UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(0, NAVA_MAXY+10, SCREEN_WIDTH, 220)];
    [self.view addSubview:backView];
    int i = 0;
    ZJLoginLabel * phoneLabel = [ZJLoginLabel ZJLoginLabelwithText:@"手机号"];
    self.userPhoneNumber = [ZJTextField ZJTextFieldWithFrame:CGRectMake(0, i*(WEEK_SCROLLERVIEW_HEIGHT+10), SCREEN_WIDTH, WEEK_SCROLLERVIEW_HEIGHT) LeftView:phoneLabel Text:@"请输入手机号码" KeyBoardType:UIKeyboardTypeNumberPad];
    //    设置底部的线条
    [_userPhoneNumber setLineViewLength:CGRectMake(SCREEN_WIDTH*0.05, _userPhoneNumber.frame.size.height, SCREEN_WIDTH*0.9, 0.5)];
    [backView addSubview: _userPhoneNumber];
    i++;
    
    ZJLoginLabel * firstPwdLabel = [ZJLoginLabel ZJLoginLabelwithText:@"密码"];
    self.firstPwd = [ZJTextField ZJTextFieldWithFrame:CGRectMake(0, i*(WEEK_SCROLLERVIEW_HEIGHT+10), SCREEN_WIDTH, WEEK_SCROLLERVIEW_HEIGHT) LeftView:firstPwdLabel Text:@"请输入新密码" KeyBoardType:UIKeyboardTypeDefault];
    _firstPwd.secureTextEntry = YES;
    //    设置底部的线条
    [_firstPwd setLineViewLength:CGRectMake(SCREEN_WIDTH*0.05, _firstPwd.frame.size.height, SCREEN_WIDTH*0.9, 0.5)];
    [backView addSubview: _firstPwd];
    i++;
    
    ZJLoginLabel * secondPwdLabel  = [ZJLoginLabel ZJLoginLabelwithText:@"确认密码"];
    self.secondPwd = [ZJTextField ZJTextFieldWithFrame:CGRectMake(0, i*(WEEK_SCROLLERVIEW_HEIGHT+10), SCREEN_WIDTH, WEEK_SCROLLERVIEW_HEIGHT) LeftView:secondPwdLabel Text:@"请再次输入新密码" KeyBoardType:UIKeyboardTypeDefault];
    [_secondPwd setLineViewLength:CGRectMake(SCREEN_WIDTH*0.05, _secondPwd.frame.size.height, SCREEN_WIDTH*0.9, 0.5)];
    _secondPwd.secureTextEntry = YES;
    [backView addSubview: _secondPwd];
    
    //    添加确认按钮
    self.confirmBtn = [UIButton ButtonWithTitle:@"确认" Frame:CGRectMake(SCREEN_WIDTH*0.05, CGRectGetMaxY(backView.frame)+30,SCREEN_WIDTH*0.9, 40) Alignment:UIControlContentHorizontalAlignmentCenter titleColor:[UIColor whiteColor]];
    _confirmBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:210/255.0 blue:0/255.0 alpha:1.0];
    [_confirmBtn addTarget:self action:@selector(confirmModify) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_confirmBtn];
    
}


- (BOOL)checkPhoneNumber:(NSString *)phoneNumber{
    NSString *regex = @"^[1][3-8]\\d{9}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:phoneNumber];
}
//确认修改按钮
-(void)confirmModify {
    //    判断两次的密码是否相同
    if (_firstPwd.text.length <= 0 ||  _secondPwd.text.length <= 0 ) {
        [SVProgressHUD showErrorWithStatus:@"密码为空，请输入"];
        return;
    }
    if (![_firstPwd.text isEqualToString:_secondPwd.text]) {
        [SVProgressHUD showErrorWithStatus:@"两次密码不一致"];
        return;
    }
//    self.paraDic = @{
//                     @"password":_firstPwd.text,
//                     @"verificationCode":_verificationCode.text,
//                     };
//    [_manager.requestSerializer setValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"token"] forHTTPHeaderField:@"token"];
//    [_manager POST:@"https://freegatty.ZJosa.xenoeye.org/ac/changePassword" parameters:_paraDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        //        修改密码后怎么办？
////        NSLog(@"%@",responseObject);
//        NSString * success = responseObject[@"success"];
////        NSString * message = responseObject[@"message"];
////        NSLog(@"%@",message);
//        if (success.intValue == 1) {
//            [SVProgressHUD showSuccessWithStatus:@"密码修改成功!"];
//        }
//        [self.navigationController popViewControllerAnimated:YES];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
////        NSLog(@"%@",error);
//        NSString *string =[[NSString alloc]initWithData:error.userInfo[@"com.alamofire.serialization.response.error.data"] encoding:NSUTF8StringEncoding];
//
//        NSLog(@"%@",string);
//        [SVProgressHUD showErrorWithStatus:@"请检查网络，稍后重试!"];
//    }];
}



@end
