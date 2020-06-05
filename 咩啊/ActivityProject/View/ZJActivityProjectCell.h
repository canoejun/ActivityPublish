//
//  ZJActivityProjectCell.h
//  咩啊
//
//  Created by canoejun on 2020/5/29.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZJHomeActivityProjectModel;
NS_ASSUME_NONNULL_BEGIN

@interface ZJActivityProjectCell : UITableViewCell
@property (nonatomic, strong, readwrite) ZJHomeActivityProjectModel *model;
@end

NS_ASSUME_NONNULL_END
