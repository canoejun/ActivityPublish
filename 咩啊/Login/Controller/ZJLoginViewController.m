//
//  ZJLoginViewController.m
//  OpenZJNG
//
//  Created by 张俊 on 2019/2/27.
//

#import "ZJLoginViewController.h"
#import "ZJTextField.h"
#import "Masonry.h"
#import "UIButton+Login.h"
#import "SVProgressHUD.h"
#import "ZJRegisterViewController.h"
#import "ZJForgetPwdViewController.h"
#import "Constants.h"
#import "ZJTabBarController.h"
#import "ZJLoginModel.h"
#import "ZJFactory.h"
#import "ZJBaseNavigationController.h"



@interface ZJLoginViewController ()<UITextFieldDelegate>
/** 账号  */
@property (nonatomic,strong) ZJTextField * userTextField;
/** 密码  */
@property (nonatomic,strong) ZJTextField * pwdTextfield;
/** 登录按钮  */
@property (nonatomic,strong) UIButton *loginBtn;
/** userDefaults  */
@property (nonatomic,strong) NSUserDefaults * userDefaults;

@end

@implementation ZJLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}



-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * phoneNumber = [self.userDefaults objectForKey:@"phoneNumber"];
    NSString * password = [self.userDefaults objectForKey:@"password"];
    
    if (phoneNumber.length > 0 && password.length >0 ) {
        self.userTextField.text = phoneNumber;
        self.pwdTextfield.text = password;
        [self login];
    }
}
//布局
-(void)setUpUI {
    self.view.backgroundColor = [UIColor whiteColor];
    //      添加图标
    UIImageView * logImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    logImageView.frame = CGRectMake(0, 170, 90, 90);
    logImageView.center = CGPointMake(self.view.center.x, logImageView.center.y);
    [self.view addSubview:logImageView];
    
    
    //    添加textfield 快速注册和忘记密码按钮
    UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(logImageView.frame)+60, SCREEN_WIDTH, 140)];
    //    backView.backgroundColor = [UIColor redColor];
    [self.view addSubview:backView];
    self.userTextField = [ZJTextField ZJTextFieldWithFrame:CGRectMake(WEEK_SCROLLERVIEW_HEIGHT, 5, SCREEN_WIDTH-2*WEEK_SCROLLERVIEW_HEIGHT, WEEK_SCROLLERVIEW_HEIGHT) LeftView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_account"]] Text:@"请输入账号" KeyBoardType:UIKeyboardTypeNumberPad];
    _userTextField.delegate = self;
    [backView addSubview:_userTextField];
    self.pwdTextfield = [ZJTextField ZJTextFieldWithFrame:CGRectMake(WEEK_SCROLLERVIEW_HEIGHT, WEEK_SCROLLERVIEW_HEIGHT+15, SCREEN_WIDTH-2*WEEK_SCROLLERVIEW_HEIGHT, WEEK_SCROLLERVIEW_HEIGHT) LeftView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_passowrd"]] Text:@"请输入密码" KeyBoardType:UIKeyboardTypeDefault];
    _pwdTextfield.delegate = self;
    _pwdTextfield.userInteractionEnabled = NO;
    _pwdTextfield.secureTextEntry = YES;
    [backView addSubview:_pwdTextfield];
    //    添加按钮
    //    registerBtn
    UIButton * registerBtn = [UIButton ButtonWithTitle:@"快速注册" Frame:CGRectMake(CGRectGetMinX(_pwdTextfield.frame), CGRectGetMaxY(_pwdTextfield.frame)+20, _pwdTextfield.frame.size.width*0.5, 25) Alignment:UIControlContentHorizontalAlignmentLeft titleColor:[UIColor blackColor]];
    [registerBtn addTarget:self action:@selector(quickRegister) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:registerBtn];
    
    UIButton * forgetPwdBtn = [UIButton ButtonWithTitle:@"忘记密码" Frame:CGRectMake(CGRectGetMaxX(registerBtn.frame), CGRectGetMaxY(_pwdTextfield.frame)+20, _pwdTextfield.frame.size.width*0.5, 25) Alignment:UIControlContentHorizontalAlignmentRight titleColor:[UIColor blackColor]];
    [forgetPwdBtn addTarget:self action:@selector(forgetPwd) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:forgetPwdBtn];
    
    //    添加登录按钮
    _loginBtn = [UIButton ButtonWithTitle:@"登录" Frame:CGRectMake(CGRectGetMinX(_pwdTextfield.frame), CGRectGetMaxY(backView.frame)+35, _pwdTextfield.frame.size.width, 40) Alignment:UIControlContentHorizontalAlignmentCenter titleColor:[UIColor whiteColor]];
    _loginBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:210/255.0 blue:0/255.0 alpha:1.0];
    [_loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginBtn];
}

//快速注册
-(void)quickRegister {
    ZJRegisterViewController * registerVc  = [[ZJRegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVc animated:YES];
}

//忘记密码
-(void)forgetPwd {
    ZJForgetPwdViewController * forgetPwdVc = [[ZJForgetPwdViewController alloc] init];
    [self.navigationController pushViewController:forgetPwdVc animated:YES];
}
//登录
-(void)login {
    
    ZJBaseNavigationController *nav = [[ZJBaseNavigationController alloc] initWithRootViewController:[[ZJTabBarController alloc] init]];
    [[UIApplication sharedApplication].keyWindow setRootViewController:nav];
    
//    if (_pwdTextfield.text.length <= 0 && _userTextField.text.length <= 0) {
//        [SVProgressHUD showErrorWithStatus:@"请填写账号和密码"];
//        if (![self checkPhoneNumber:_userTextField.text]) {
//            [SVProgressHUD showErrorWithStatus:@"请检查手机号"];
//        }
//        return ;
//    }
//    [SVProgressHUD showWithStatus:@"请稍后..."];
    
    
//    登录请求
//    AFHTTPSessionManager * manger = [ZJFactory ZJFactoryAFNManage];
//
//    NSDictionary * paraDic = @{
//                               @"phoneNumber":_userTextField.text,
//                               @"password":_pwdTextfield.text
//                               };
//    [manger POST:@"https://freegatty.ZJosa.xenoeye.org/ac/login" parameters:paraDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        ZJLoginModel * loginModel = [ZJLoginModel mj_objectWithKeyValues:responseObject];
//        if(loginModel.success.intValue != 1) {
//            [SVProgressHUD showErrorWithStatus:@"请检查账户和密码后重试"];
//            return ;
//        }
////        将登录的token进行解析出来，然后存放到NSuserdefaults中
////        NSLog(@"%@------",loginModel.result[@"acToken"]);
//        [self.userDefaults setObject:loginModel.result[@"acToken"] forKey:@"token"];
//        [self.userDefaults setObject:self.userTextField.text forKey:@"phoneNumber"];
//        [self.userDefaults setObject:self.pwdTextfield.text forKey:@"password"];
//        [self.userDefaults synchronize];
//
//        [SVProgressHUD dismiss];
//
//        ZJTabBarController * tabVc = [[ZJTabBarController alloc] init];
//        [[UIApplication sharedApplication].keyWindow setRootViewController:tabVc];
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [SVProgressHUD showErrorWithStatus:@"请检查网络!"];
//    }];
}


#pragma mark ------ UITextFieldDelegate ------

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self becomeFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (textField == _userTextField && range.location >= 11) {
        return NO;
    }
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField == _userTextField && _userTextField.text.length == 11) {
        _pwdTextfield.userInteractionEnabled = YES;
    }
}

- (BOOL)checkPhoneNumber:(NSString *)phoneNumber
{
    NSString *regex = @"^[1][3-8]\\d{9}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:phoneNumber];
}

#pragma mark ------ 手势 ------
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


@end
