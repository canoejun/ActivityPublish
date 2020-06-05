//
//  ZJHotActivityView.h
//  咩啊
//
//  Created by canoejun on 2020/5/29.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZJBaseDataSource;

@protocol ZJHotActivityViewDelegate <NSObject>

-(void)hotActivityViewCellDidClicked:(NSString *_Nullable)nextController detailLink:(NSString *_Nullable)url;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ZJHotActivityView : UIView
@property (nonatomic, weak, readwrite) id<ZJHotActivityViewDelegate> delegate;
-(instancetype)initWithFrame:(CGRect)frame dataSource:(ZJBaseDataSource *)dataSource;
@end

NS_ASSUME_NONNULL_END
