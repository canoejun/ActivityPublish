//
//  ZJActivityProjectCell.m
//  咩啊
//
//  Created by canoejun on 2020/5/29.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJActivityProjectCell.h"
#import "Masonry/Masonry.h"
#import "ZJHomeActivityProjectModel.h"
#import "SDWebImage/SDWebImage.h"

@interface ZJActivityProjectCell ()
@property (nonatomic, strong, readwrite) UIImageView *imgView;
@property (nonatomic, strong, readwrite) UILabel *titleLable;
@property (nonatomic, strong, readwrite) UILabel *timeLable;
@end

@implementation ZJActivityProjectCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self __setUI];
    }
    return self;
}

-(void)setModel:(ZJHomeActivityProjectModel *)model{
    _model = model;
//    _imgView.image = [UIImage imageNamed:model.ClassImageUrl];
    [_imgView sd_setImageWithURL:[NSURL URLWithString:model.ClassImageUrl] placeholderImage:[UIImage imageNamed:@"logo.png"]];
    _titleLable.text = model.ClassName;
    _timeLable.text = [NSString stringWithFormat:@"活动时间：%@-%@",model.ClassBeginTime,model.ClassEndTime];
}


-(void)__setUI{
    //    添加图片
    [self.contentView addSubview:self.imgView];
    //    添加标题
    [self.contentView addSubview:self.titleLable];
    //    添加活动时间
    [self.contentView addSubview:self.timeLable];
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(15);
        make.right.equalTo(self.contentView).offset(-15);
        make.height.equalTo(@180);
    }];
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.imgView);
        make.top.equalTo(self.imgView.mas_bottom).offset(5);
        make.height.equalTo(@25);
    }];
    
    [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.imgView);
        make.top.equalTo(self.titleLable.mas_bottom).offset(5);
        make.bottom.equalTo(self.contentView).offset(-15);
    }];
    
}


#pragma ---------------------lazyLoad------------------------------
- (UIImageView *)imgView{
    if(!_imgView){
        _imgView = [[UIImageView alloc] init];
    }
    return _imgView;
}

-(UILabel *)titleLable{
    if(!_titleLable){
        _titleLable = [[UILabel alloc] init];
        _titleLable.font = [UIFont systemFontOfSize:20];
    }
    return _titleLable;
}
-(UILabel *)timeLable{
    if(!_timeLable){
        _timeLable = [[UILabel alloc] init];
        _timeLable.font = [UIFont systemFontOfSize:15];
        _timeLable.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];

    }
    return _timeLable;
}


@end
