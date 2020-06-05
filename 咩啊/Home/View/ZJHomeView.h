//
//  ZJHomeView.h
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZJBaseDataSource;

@protocol ZJHomeViewDelegate <NSObject>

-(void)ZJHomeMoreDetailDidClicked:(NSString *_Nullable)nextControllerName dataSource:(ZJBaseDataSource *_Nullable)dataSource;
-(void)ZJHomeCellDidClicked:(NSString *_Nullable)nextControllerName detailLink:(NSString *_Nullable)url;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ZJHomeView : UIView
@property (nonatomic, weak, readwrite) id<ZJHomeViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
