//
//  ZJMineHeadView.h
//  咩啊
//
//  Created by canoejun on 2020/5/23.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZJMineHeadViewDelegate <NSObject>

-(void)ZJMineHeadViewModuleViewDidClicked:(NSString *_Nullable)nextControllerName;

-(void)ZJMineHeadViewModuleViewDidClicked:(NSString *_Nullable)nextControllerName model:(id _Nullable)model;

-(void)ZJMineHeadViewIdentityDidClicked;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ZJMineHeadView : UIView
@property (nonatomic, weak, readwrite) id<ZJMineHeadViewDelegate> delegate;
-(void)updateNameMotto;
@end

NS_ASSUME_NONNULL_END
