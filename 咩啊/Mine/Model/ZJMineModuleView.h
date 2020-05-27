//
//  ZJMineModuleView.h
//  咩啊
//
//  Created by canoejun on 2020/5/22.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum Module: NSUInteger {
    ModuleSigned = 1 << 0,
    ModuleCollection = 1 << 1,
    ModuleHistoryActivity = 1 << 2,
    ModuleIdentityAuthentiation = 1 << 3
} ModuleViewState;

NS_ASSUME_NONNULL_BEGIN

@interface ZJMineModuleView : UIView

@property (nonatomic, strong, readwrite) UIImageView *imgView;
@property (nonatomic, strong, readwrite) UILabel *contentLabel;

@property (nonatomic, assign, readwrite) ModuleViewState state;

+(ZJMineModuleView *)moduleViewWithFrame:(CGRect)frame imageName:(NSString *)imageName moduleName:(NSString *)moduleName state:(ModuleViewState)state;
-(ZJMineModuleView *)initWithFrame:(CGRect)frame imageName:(NSString *)imageName moduleName:(NSString *)moduleName state:(ModuleViewState)state ratio:(CGFloat)ratio;

-(void)updateText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
