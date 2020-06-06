//
//  ZJActivityProjectCell.m
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJHomeActivityProjectCell.h"
#import "ZJHomeActivityProjectModel.h"
#import "SDWebImage/SDWebImage.h"

@implementation ZJHomeActivityProjectCell
-(instancetype)initWithFrame:(CGRect)frame
                       model:(ZJHomeActivityProjectModel *)model{
    if(self = [super initWithFrame:frame]){
        self.model = model;
        
        UIView *view = [[UIView alloc] initWithFrame:self.bounds];
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.35;
        [self addSubview:view];
        
        self.userInteractionEnabled = YES;
//        self.image = [UIImage imageNamed:model.ClassImageUrl];
        [self sd_setImageWithURL:[NSURL URLWithString:model.ClassImageUrl] placeholderImage:[UIImage imageNamed:@"logo"]];
        
        CGFloat padding = 10;
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(padding, 0, frame.size.width - 2.0*padding, frame.size.height)];
        titleLabel.numberOfLines = 0;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:model.ClassName attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 16],NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]}];
        
        titleLabel.attributedText = string;
        [self addSubview:titleLabel];
        
        self.layer.cornerRadius = 5.f;
    }
    return self;
}



@end
