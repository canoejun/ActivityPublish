//
//  ZJBaseDetailViewController.h
//  咩啊
//
//  Created by canoejun on 2020/5/29.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJBaseDetailViewController : UIViewController
@property (nonatomic, copy, readwrite) NSString *url;
-(instancetype)initWithDetailLink:(NSString *)url;
@end

NS_ASSUME_NONNULL_END
