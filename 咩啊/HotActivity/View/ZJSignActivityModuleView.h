//
//  ZJSignActivityModuleView.h
//  咩啊
//
//  Created by canoejun on 2020/6/5.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJSignActivityModuleView : UIView
@property (nonatomic, strong, readwrite) UITextField *textFiled;
-(instancetype)initTextFieldWithFrame:(CGRect)frame title:(NSString *)title placeText:(NSString *)placeText;
@end

NS_ASSUME_NONNULL_END
