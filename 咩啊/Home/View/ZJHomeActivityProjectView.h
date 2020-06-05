//
//  ZJHomeActivityProjectView.h
//  咩啊
//
//  Created by canoejun on 2020/6/4.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZJBaseDataSource;


@protocol ZJActivityProjectViewDelegate <NSObject>

-(void)activityProjectViewCellDidClicked:(UITapGestureRecognizer *_Nullable)tapGesture;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ZJHomeActivityProjectView : UIView
@property (nonatomic, strong, readwrite) ZJBaseDataSource *dataSource;

@property (nonatomic, weak, readwrite) id<ZJActivityProjectViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame dataSource:(ZJBaseDataSource *)dataSource;
-(void)reloadData;
@end

NS_ASSUME_NONNULL_END
