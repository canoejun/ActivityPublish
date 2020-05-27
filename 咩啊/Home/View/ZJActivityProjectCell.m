//
//  ZJActivityProjectCell.m
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJActivityProjectCell.h"

@implementation ZJActivityProjectCell
-(instancetype)initWithFrame:(CGRect)frame
                       title:(NSString *)title
                      imgUrl:(NSString *)imgUrl{
    if(self = [super initWithFrame:frame]){
        self.image = [UIImage imageNamed:imgUrl];
        CGFloat padding = 10;
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(padding, 0, self.frame.size.width - 2.0*padding, 35)];
        titleLabel.text = title;
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textColor = [UIColor blueColor];
        [self addSubview:titleLabel];
    }
    return self;
}

@end
