//
//  ZJActivityNewsCell.m
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJHomeActivityNewsCell.h"
#import "Masonry/Masonry.h"
#import "ZJHomeUniversalModel.h"
#import "SDWebImage/SDWebImage.h"

@interface ZJHomeActivityNewsCell ()
@property (nonatomic, strong, readwrite) UILabel *titleLabel;
//举办单位
@property (nonatomic, strong, readwrite) UILabel *hostUnitLabel;
//参加的人数
@property (nonatomic, strong, readwrite) UILabel *joinPeopleCountLabel;
//活动图片
@property (nonatomic, strong, readwrite) UIImageView *activityImage;
//小图标
@property (nonatomic, strong, readwrite) UIImageView *littleImage;
@end

@implementation ZJHomeActivityNewsCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self __setUI];
    }
    return self;
}

-(void)setModel:(ZJHomeUniversalModel *)model{
    _model = model;
    _titleLabel.text = model.title;
    _hostUnitLabel.text = model.hostUnit;
    _joinPeopleCountLabel.text = [NSString stringWithFormat:@"已有%@人参加",model.joinPeopleCount];
    
    [_activityImage sd_setImageWithURL:[NSURL URLWithString:model.activityImageUrl] placeholderImage:[UIImage imageNamed:@"logo.png"]
     ];
    [_littleImage sd_setImageWithURL:[NSURL URLWithString:model.hostIconUrl] placeholderImage:[UIImage imageNamed:@"logo.png"]];
}

-(void)__setUI{
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.hostUnitLabel];
    [self.contentView addSubview:self.joinPeopleCountLabel];
    [self.contentView addSubview:self.activityImage];
    [self.contentView addSubview:self.littleImage];
    
//    布局
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView);
        make.height.equalTo(@40);
        make.width.equalTo(@200);
    }];
    
    [self.littleImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.width.height.equalTo(@35);
    }];
    
    [self.hostUnitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.littleImage);
        make.left.equalTo(self.littleImage.mas_right).offset(10);
        make.width.equalTo(@160);
        make.height.equalTo(@15);
    }];
    
    [self.joinPeopleCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(self.hostUnitLabel);
        make.top.equalTo(self.hostUnitLabel.mas_bottom).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    
    [self.activityImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel);
        make.right.equalTo(self.contentView);
        make.bottom.equalTo(self.littleImage);
        make.width.equalTo(self.activityImage.mas_height).multipliedBy(400.0/191.0);
    }];
    
}

#pragma ---------------------lazyLoad------------------------------
-(UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _titleLabel;
}

-(UILabel *)hostUnitLabel{
    if(!_hostUnitLabel){
        _hostUnitLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        _hostUnitLabel.font = [UIFont systemFontOfSize:13];
    }
    return _hostUnitLabel;;
}
-(UILabel *)joinPeopleCountLabel{
    if(!_joinPeopleCountLabel){
        _joinPeopleCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        _joinPeopleCountLabel.font = [UIFont systemFontOfSize:12];
        _joinPeopleCountLabel.textColor = [UIColor lightGrayColor];
    }
    return _joinPeopleCountLabel;
}
-(UIImageView *)activityImage{
    if(!_activityImage){
        _activityImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        _activityImage.layer.cornerRadius = 50;
    }
    return _activityImage;
}

-(UIImageView *)littleImage{
    if(!_littleImage){
        _littleImage = [[UIImageView alloc] init];
    }
    return _littleImage;
}


@end
