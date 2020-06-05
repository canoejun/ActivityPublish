//
//  ZJActivityDetailView.h
//  咩啊
//
//  Created by canoejun on 2020/5/29.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZJActivityDetailModel;

@protocol ActivityDetailViewDelegate <NSObject>

-(void)signBtnDidClickedWithModel:(ZJActivityDetailModel *_Nullable)model;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ZJActivityDetailView : UIScrollView
@property (nonatomic, weak, readwrite) id<ActivityDetailViewDelegate> detailViewDelegate;
-(instancetype)initWithFrame:(CGRect)frame detailLink:(NSString *)url;
@end

NS_ASSUME_NONNULL_END
