//
//  ZJRegisterViewController.m
//  OpenZJNG
//
//  Created by 张俊 on 2019/2/27.
//

#import "ZJRegisterViewController.h"
#import "Constants.h"
#import "ZJTextField.h"
#import "ZJLoginLabel.h"
#import "UIButton+Login.h"
#import "SVProgressHUD.h"
#import "ZJFactory.h"
#import "ZJLoginViewController.h"

#import "ZJUsersModel.h"



@interface ZJRegisterViewController ()<UITextFieldDelegate>
/** 手机号  */
@property (nonatomic,strong) ZJTextField * userPhoneNumber;
/** 验证码  */
//@property (nonatomic,strong) ZJTextField * verificationCode;
/** 第一次密码  */
@property (nonatomic,strong) ZJTextField * firstPwd;
/** 第二次密码  */
@property (nonatomic,strong) ZJTextField * secondPwd;
/** 注册按钮  */
@property (nonatomic,strong) UIButton * registerBtn;
@end

@implementation ZJRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    [self setUpUI];
}

-(void)setUpUI {
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"快速注册";
    //    添加手机号  密码  验证码等textfield
    UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(0, NAVA_MAXY+10, SCREEN_WIDTH, 220)];
    [self.view addSubview:backView];
    int i = 0;
    ZJLoginLabel * phoneLabel = [ZJLoginLabel ZJLoginLabelwithText:@"手机号"];
    self.userPhoneNumber = [ZJTextField ZJTextFieldWithFrame:CGRectMake(0, i*(WEEK_SCROLLERVIEW_HEIGHT+10), SCREEN_WIDTH, WEEK_SCROLLERVIEW_HEIGHT) LeftView:phoneLabel Text:@"请输入手机号码" KeyBoardType:UIKeyboardTypeNumberPad];
    //    设置底部的线条
    [_userPhoneNumber setLineViewLength:CGRectMake(SCREEN_WIDTH*0.05, _userPhoneNumber.frame.size.height, SCREEN_WIDTH*0.9, 0.5)];
    [backView addSubview: _userPhoneNumber];
    i++;
    
    
    ZJLoginLabel * firstPwdLabel  = [ZJLoginLabel ZJLoginLabelwithText:@"密码"];
    self.firstPwd = [ZJTextField ZJTextFieldWithFrame:CGRectMake(0, i*(WEEK_SCROLLERVIEW_HEIGHT+10), SCREEN_WIDTH, WEEK_SCROLLERVIEW_HEIGHT) LeftView:firstPwdLabel Text:@"请输入密码" KeyBoardType:UIKeyboardTypeDefault];
    [_firstPwd setLineViewLength:CGRectMake(SCREEN_WIDTH*0.05, _userPhoneNumber.frame.size.height, SCREEN_WIDTH*0.9, 0.5)];
    _firstPwd.secureTextEntry = YES;
    [backView addSubview: _firstPwd];
    i++;
    
    UILabel * secondPwdLabel  = [ZJLoginLabel ZJLoginLabelwithText:@"确认密码"];
    self.secondPwd = [ZJTextField ZJTextFieldWithFrame:CGRectMake(0, i*(WEEK_SCROLLERVIEW_HEIGHT+10), SCREEN_WIDTH, WEEK_SCROLLERVIEW_HEIGHT) LeftView:secondPwdLabel Text:@"请再次输入密码" KeyBoardType:UIKeyboardTypeDefault];
    _secondPwd.secureTextEntry = YES;
    [_secondPwd setLineViewLength:CGRectMake(SCREEN_WIDTH*0.05, _userPhoneNumber.frame.size.height, SCREEN_WIDTH*0.9, 0.5)];
    [backView addSubview: _secondPwd];
    
    
    //    添加注册按钮
    self.registerBtn = [UIButton ButtonWithTitle:@"注册" Frame:CGRectMake(SCREEN_WIDTH*0.05, CGRectGetMaxY(backView.frame)+30,SCREEN_WIDTH*0.9, 40) Alignment:UIControlContentHorizontalAlignmentCenter titleColor:[UIColor whiteColor]];
    _registerBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:210/255.0 blue:0/255.0 alpha:1.0];
    [_registerBtn addTarget:self action:@selector(registerAndBinding) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerBtn];
}


-(void)registerAndBinding {
    //    判断两次的密码是否相同
    if (_firstPwd.text.length <= 0 ||  _secondPwd.text.length <= 0 ) {
        [SVProgressHUD showErrorWithStatus:@"密码为空，请输入"];
        return;
    }
    if (![_firstPwd.text isEqualToString:_secondPwd.text]) {
        [SVProgressHUD showErrorWithStatus:@"两次密码不一致"];
        return;
    }
    
    NSDictionary *params = @{
                     @"phone":_userPhoneNumber.text,
                     @"password":_firstPwd.text,
//                     @"verificationCode":_verificationCode.text
                     };
    
    [ZJUsersModel userActWithLink:@"http://47.92.93.38:443/user/create" params:params success:^(id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject);
        NSString *info = responseObject[@"info"];
        if([info isEqualToString:@"注册成功"]){
            [SVProgressHUD showSuccessWithStatus:@"注册成功!"];
            [self.navigationController popViewControllerAnimated:YES];
        }
    } failure:^(id  _Nullable error) {
        NSLog(@"%@",error);
        NSError *errorInfo = (NSError *)error;
        // 通过error信息进行获取
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:errorInfo.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] options:0 error:nil];
        // 错误码
        NSString *info = response[@"error"];
        if (info){
            if([info containsString:@"此手机号"]){
                [SVProgressHUD showErrorWithStatus:@"已存在账号,请登录!"];
            }else{
                [SVProgressHUD showErrorWithStatus:@"发生错误，稍后重试!"];
            }
            return;
        }
        [SVProgressHUD showErrorWithStatus:@"请检查网络，稍后重试!"];
    }];
}

- (BOOL)checkPhoneNumber:(NSString *)phoneNumber
{
    NSString *regex = @"^[1][3-8]\\d{9}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:phoneNumber];
}

#pragma mark mark ------ 手势 ------
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark mark ------ UITextFieldDelegate ------

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField == _userPhoneNumber) {
        if (_userPhoneNumber.text.length >= 11) {
            return NO;
        }
    }
    return YES;
}




@end
