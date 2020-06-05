//
//  ZJActivityProjectCell.h
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZJHomeActivityProjectModel;

NS_ASSUME_NONNULL_BEGIN

@interface ZJHomeActivityProjectCell : UIImageView

@property (nonatomic, strong, readwrite) ZJHomeActivityProjectModel *model;

-(instancetype)initWithFrame:(CGRect)frame
                      model:(ZJHomeActivityProjectModel *)model;
@end

NS_ASSUME_NONNULL_END
