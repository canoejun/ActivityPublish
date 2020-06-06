//
//  ZJCollectionView.h
//  咩啊
//
//  Created by canoejun on 2020/5/24.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZJCollectionCell;

@protocol ZJCollectionViewDelegate <NSObject>

-(void)collectionViewCellDidClickedNextController:(NSString *_Nullable)nextController detailLink:(NSString *_Nullable)url;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ZJCollectionView : UIView
@property (nonatomic, weak, readwrite) id<ZJCollectionViewDelegate> delegate;
-(void)updateData;
@end

NS_ASSUME_NONNULL_END
