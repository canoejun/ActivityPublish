//
//  ZJActivityProjectView.h
//  咩啊
//
//  Created by canoejun on 2020/5/29.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

//@class ZJHomeActivityProjectModel;
@class ZJBaseDataSource;

@protocol ActivityProjectCellDidClickedDelagate <NSObject>

-(void)activityProjectCellDidClicked:(NSString *_Nullable)detailLink;

@end

NS_ASSUME_NONNULL_BEGIN


@interface ZJActivityProjectView : UIView
@property (nonatomic, weak, readwrite) id<ActivityProjectCellDidClickedDelagate> delegate;
-(instancetype)initWithFrame:(CGRect)frame dataSource:(ZJBaseDataSource *)dataSource;
@end

NS_ASSUME_NONNULL_END
