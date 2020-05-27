//
//  ZJMoreDetailButton.m
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJMoreDetailButton.h"

@interface ZJMoreDetailButton ()
@property (nonatomic, strong, readwrite) UIImageView *imgView;
@end

@implementation ZJMoreDetailButton

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title{
    if(self = [super initWithFrame:frame]){
        self.textLabel.text = title;
        [self __setUI];
    }
    return self;
}



#pragma ---------------------privateMethod------------------------------
-(void)__setUI{
    [self addSubview:self.textLabel];
    [self addSubview:self.imgView];
    
    self.imgView.frame = CGRectMake(CGRectGetMaxX(self.textLabel.frame), 0, 12, 12);
    
}

#pragma ---------------------lazyLoad------------------------------
-(UILabel *)textLabel{
    if(!_textLabel){
        _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 15)];
        _textLabel.font = [UIFont systemFontOfSize:13];
        _textLabel.textColor = [UIColor lightGrayColor];
    }
    return _textLabel;
}

-(UIImageView *)imgView{
    if(!_imgView){
        _imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"more"]];
    }
    return _imgView;
}


@end
