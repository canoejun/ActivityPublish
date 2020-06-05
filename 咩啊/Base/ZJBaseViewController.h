//
//  ZJBaseViewController.h
//  咩啊
//
//  Created by canoejun on 2020/5/28.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZJBaseDataSource;

NS_ASSUME_NONNULL_BEGIN

@interface ZJBaseViewController : UIViewController<UITableViewDelegate>
@property (nonatomic, strong, readwrite) ZJBaseDataSource *dataSource;
@end

NS_ASSUME_NONNULL_END
