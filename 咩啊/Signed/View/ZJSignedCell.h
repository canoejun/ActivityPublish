//
//  ZJSignedCell.h
//  咩啊
//
//  Created by canoejun on 2020/5/23.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZJSignedModel;

NS_ASSUME_NONNULL_BEGIN

@interface ZJSignedCell : UITableViewCell
@property (nonatomic, strong, readwrite) ZJSignedModel *model;
@end

NS_ASSUME_NONNULL_END
