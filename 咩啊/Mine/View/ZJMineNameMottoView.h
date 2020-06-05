//
//  ZJMineNameMottoView.h
//  咩啊
//
//  Created by canoejun on 2020/5/30.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZJMineNameMottoDelegate <NSObject>

-(void)showAlertVc:(UIAlertController *_Nullable)alertVc;
-(void)updateNameMottoModel:(id _Nullable)model;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ZJMineNameMottoView : UIView
@property (nonatomic, weak, readwrite) id<ZJMineNameMottoDelegate> delegate;

-(instancetype)initWithFrame:(CGRect)frame model:(id)model;
@end

NS_ASSUME_NONNULL_END
