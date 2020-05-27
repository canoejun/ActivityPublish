//
//  ZJSignedCell.m
//  咩啊
//
//  Created by canoejun on 2020/5/23.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJSignedCell.h"
#import "ZJSignedModel.h"
#import "Masonry/Masonry.h"

@interface ZJSignedCell ()
@property (nonatomic, strong, readwrite) UILabel *titleLabel;

@property (nonatomic, strong, readwrite) UILabel *locationLabel;

@property (nonatomic, strong, readwrite) UILabel *timeLable;

@property (nonatomic, strong, readwrite) UIImageView *imgView;

@end

@implementation ZJSignedCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self __setUI];
    }
    return self;
}

-(void)__setUI{
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.locationLabel];
    [self.contentView addSubview:self.timeLable];
    [self.contentView addSubview:self.imageView];
    
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.height.equalTo(@35);
        make.width.equalTo(@200);
    }];
    
    [self.locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.height.equalTo(@10);
    }];
    
    [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleLabel);
        make.top.equalTo(self.locationLabel.mas_bottom).offset(10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.width.equalTo(@120);
        make.height.equalTo(@92);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    
}



-(void)setModel:(ZJSignedModel *)model{
    _model = model;
//        self.titleLabel.text = model.title;
//        self.locationLabel.text = [NSString stringWithFormat:@"活动地点：%@",model.location];
//        self.timeLable.text = [NSString stringWithFormat:@"活动时间：%@",model.time];
//        self.imageView.image = [UIImage imageNamed:model.imageUrl];
    
    self.titleLabel.text = @"测试";
    self.locationLabel.text = [NSString stringWithFormat:@"活动地点：%@",@1];
    self.timeLable.text = [NSString stringWithFormat:@"活动时间：%@",@2];
    self.imageView.image = [UIImage imageNamed:@"icon"];
}

#pragma ---------------------lazyLoad------------------------------
- (UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    }
    return _titleLabel;
}
- (UILabel *)locationLabel{
    if(!_locationLabel){
        _locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    }
    return _locationLabel;
}
- (UILabel *)timeLable{
    if(!_timeLable){
        _timeLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    }
    return _timeLable;
}
- (UIImageView *)imageView{
    if(!_imgView){
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    }
    return _imgView;
}




@end
