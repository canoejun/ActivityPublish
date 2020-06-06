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
#import "SDWebImage/SDWebImage.h"

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
        make.height.equalTo(@12);
    }];
    
    [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(self.titleLabel);
        make.top.equalTo(self.locationLabel.mas_bottom).offset(10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];

    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.bottom.equalTo(self.timeLable.mas_bottom).offset(-10);
        make.width.equalTo(self.imageView.mas_height).multipliedBy(350.0/191.0);
    }];
    
    [self layoutIfNeeded];
    [self setNeedsLayout];
    self.imageView.layer.cornerRadius = 12;
    self.imageView.layer.masksToBounds = YES;
    

    
}



-(void)setModel:(ZJSignedModel *)model{
    _model = model;
    self.titleLabel.text = model.title;
    self.locationLabel.text = [NSString stringWithFormat:@"活动地点：%@",model.location];
    self.timeLable.text = [NSString stringWithFormat:@"活动时间：%@",model.time];
//        self.imageView.image = [UIImage imageNamed:@"icon"];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@"logo"]];
    
}

#pragma mark ---------------------lazyLoad------------------------------
- (UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        _titleLabel.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
        _titleLabel.font = [UIFont fontWithName:@"PingFang SC" size: 16];
    }
    return _titleLabel;
}
- (UILabel *)locationLabel{
    if(!_locationLabel){
        _locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        _locationLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        _locationLabel.font = [UIFont fontWithName:@"PingFang SC" size: 12];
    }
    return _locationLabel;
}
- (UILabel *)timeLable{
    if(!_timeLable){
        _timeLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        _timeLable.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        _timeLable.font = [UIFont fontWithName:@"PingFang SC" size: 12];
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
