//
//  ZJHotActivityCell.h
//  咩啊
//
//  Created by canoejun on 2020/5/29.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZJHomeUniversalModel;
NS_ASSUME_NONNULL_BEGIN

@interface ZJHotActivityCell : UITableViewCell
@property (nonatomic, strong, readwrite) ZJHomeUniversalModel *model;

-(void)setRankImageWithIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
