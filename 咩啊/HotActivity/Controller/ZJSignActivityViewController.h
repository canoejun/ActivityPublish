//
//  ZJSignActivityViewController.h
//  咩啊
//
//  Created by canoejun on 2020/5/30.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJSignActivityViewController : UIViewController
@property (nonatomic, copy, readwrite) NSString *activityID;
@property (nonatomic, strong, readwrite) UIButton *signBtn;
@end

NS_ASSUME_NONNULL_END
