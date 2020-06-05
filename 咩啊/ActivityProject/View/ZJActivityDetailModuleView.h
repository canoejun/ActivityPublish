//
//  ZJActivityDetailModuleView.h
//  咩啊
//
//  Created by canoejun on 2020/6/4.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJActivityDetailModuleView : UIView
@property (nonatomic, strong, readwrite) UILabel *detailLable;
-(UIView *)initWithFrame:(CGRect)frame  text1:(NSString *)text1;
@end

NS_ASSUME_NONNULL_END
