//
//  ZJActivityNewsHeaderView.h
//  咩啊
//
//  Created by canoejun on 2020/5/28.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZJBaseDataSource;

@protocol ZJHomeHeaderViewDelegate <NSObject>

-(void)ZJHomeHeaderViewMoreDetailDidClicked:(NSString *_Nullable)nextControllerName dataSource:(ZJBaseDataSource *_Nullable)dataSource;
-(void)ZJHomeHeaderViewCellDidClicked:(NSString *_Nullable)nextControllerName detailLink:(NSString *_Nullable)url;
-(void)ZJHomeHeaderViewTypeDicClicked:(NSArray *_Nullable)dataArray;
@end

NS_ASSUME_NONNULL_BEGIN

@interface ZJActivityNewsHeaderView : UIView
@property (nonatomic, weak, readwrite) id<ZJHomeHeaderViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
