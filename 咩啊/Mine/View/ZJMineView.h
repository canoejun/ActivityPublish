//
//  ZJMineView.h
//  咩啊
//
//  Created by canoejun on 2020/5/22.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZJMineViewDelegate <NSObject>

-(void)pushToNextController:(NSString *_Nullable)nextControllerName;
-(void)pushToNextController:(NSString *_Nullable)nextControllerName model:(id _Nullable)model;
-(void)showAlertVc:(UIAlertController *_Nullable)alertVc;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ZJMineView : UIView
@property (nonatomic, weak, readwrite) id<ZJMineViewDelegate> delegate;
-(void)reload;
@end

NS_ASSUME_NONNULL_END
