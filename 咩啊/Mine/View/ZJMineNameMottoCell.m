//
//  ZJMineNameMottoCell.m
//  咩啊
//
//  Created by canoejun on 2020/5/30.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJMineNameMottoCell.h"

@interface ZJMineNameMottoCell ()

@end

@implementation ZJMineNameMottoCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self __setUI];
    }
    return self;
}

-(UILabel *)contentLabel{
    if(!_contentLabel){
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _contentLabel;
}
-(UILabel *)remindLabel{
    if(!_remindLabel){
        _remindLabel = [[UILabel alloc] init];
        _remindLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    }
    return _remindLabel;
}

-(void)__setUI{
//    添加名字和座右铭
    [self.contentView addSubview:self.remindLabel];
    [self.contentView addSubview:self.contentLabel];
    
    _remindLabel.frame = CGRectMake(15, 0, 80, self.frame.size.height);
    _contentLabel.frame = CGRectMake(CGRectGetMaxX(_remindLabel.frame), 0,  self.frame.size.width - CGRectGetMaxX(_remindLabel.frame), self.frame.size.height);
}


@end
