//
//  ZJCollectionCell.h
//  咩啊
//
//  Created by canoejun on 2020/5/25.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ZJCollectionModel;

NS_ASSUME_NONNULL_BEGIN

@interface ZJCollectionCell : UICollectionViewCell

@property (nonatomic, strong, readwrite) ZJCollectionModel *model;
@property (nonatomic, strong, readwrite) UIButton *selectBtn;

-(void)showSelectedBtn;
-(void)hideSelectedBtn;
@end

NS_ASSUME_NONNULL_END
