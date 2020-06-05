//
//  ZJHomeHotActivityCellTableViewCell.h
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZJHomeUniversalModel;

NS_ASSUME_NONNULL_BEGIN

@interface ZJHomeHotActivityCell : UITableViewCell
@property (nonatomic, strong, readwrite) ZJHomeUniversalModel *model;
@end

NS_ASSUME_NONNULL_END
