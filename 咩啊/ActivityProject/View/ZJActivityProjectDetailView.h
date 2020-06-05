//
//  ZJActivityProjectDetailView.h
//  咩啊
//
//  Created by canoejun on 2020/5/29.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class ZJHomeActivityProjectModel;
NS_ASSUME_NONNULL_BEGIN

@protocol  ZJActivityDetailViewDelegate<NSObject>

-(void)activityDetailTableViewCellDidClicked:(NSString *_Nullable)nextControllerName detailLink:(NSString *_Nullable)url;

@end

@interface ZJActivityProjectDetailView : UIScrollView
//-(instancetype)initWithFrame:(CGRect)frame detailModel:(ZJHomeActivityProjectModel *)model;
@property (nonatomic, weak, readwrite) id<ZJActivityDetailViewDelegate> detailViewDelegate;
-(instancetype)initWithFrame:(CGRect)frame detailLink:(NSString *)url;
@end

NS_ASSUME_NONNULL_END
