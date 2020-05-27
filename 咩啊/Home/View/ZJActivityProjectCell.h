//
//  ZJActivityProjectCell.h
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJActivityProjectCell : UIImageView

-(instancetype)initWithFrame:(CGRect)frame
                       title:(NSString *)title
                      imgUrl:(NSString *)imgUrl;
@end

NS_ASSUME_NONNULL_END
