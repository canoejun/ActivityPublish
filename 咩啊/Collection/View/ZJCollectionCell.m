//
//  ZJCollectionCell.m
//  咩啊
//
//  Created by canoejun on 2020/5/25.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJCollectionCell.h"
#import "Masonry/Masonry.h"
#import "ZJCollectionModel.h"
#import "ZJMineModuleView.h"

@interface ZJCollectionCell ()
@property (nonatomic, strong, readwrite) UIView *moduleView;
@property (nonatomic, strong, readwrite) UILabel *contentLable;
@property (nonatomic, strong, readwrite) UIImageView *imgView;

@end

@implementation ZJCollectionCell

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self __setUI];
    }
    return self;
}


-(void)setModel:(ZJCollectionModel *)model{
    //    设置图片和文字
    _model = model;
    _imgView.image = [UIImage imageNamed:model.imgUrl];
    _contentLable.text = [NSString stringWithFormat:@"collection :%@",model.content];
}

-(void)showSelectedBtn{
    [UIView animateWithDuration:0.5 animations:^{
        self.moduleView.transform = CGAffineTransformMakeTranslation(25, 0);
    }];
}
-(void)hideSelectedBtn{
    [UIView animateWithDuration:0.5 animations:^{
        self.moduleView.transform = CGAffineTransformIdentity;
    }];
}


#pragma ---------------------privateMethod------------------------------
-(void)__setUI{
    
    [self.contentView addSubview:self.selectBtn];
    [self.contentView addSubview:self.moduleView];
    [self.moduleView addSubview:self.imgView];
    [self.moduleView addSubview:self.contentLable];
//    [self.contentView addSubview:self.testLabel];
    
    
    [self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@18);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
    [self.moduleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.left.equalTo(self.selectBtn);
        make.bottom.right.equalTo(self.contentView).offset(-15);
    }];
    CGFloat ratio = 11.0/13.0;
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.moduleView);
        make.height.equalTo(self.moduleView).multipliedBy(ratio);
    }];
    
    [self.contentLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.moduleView);
        make.height.equalTo(self.moduleView).multipliedBy(1- ratio);
    }];
    
    
    
}

#pragma ---------------------lazyLoad------------------------------
-(UIView *)moduleView{
    if(!_moduleView){
//        _moduleView = [[ZJMineModuleView alloc] initWithFrame:CGRectMake(0, 0, 40, 40) imageName:@"" moduleName:@"0" state:0 ratio:11.0/13.0];
        _moduleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    }
    return _moduleView;
}

-(UIButton *)selectBtn{
    if(!_selectBtn){
        _selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectBtn.frame = CGRectMake(0, 0, 18, 18);
        _selectBtn.layer.borderColor = [UIColor grayColor].CGColor;
        _selectBtn.layer.borderWidth = 0.5f;
        _selectBtn.layer.cornerRadius = _selectBtn.frame.size.height * 0.5;
        [_selectBtn setBackgroundImage:[UIImage imageNamed:@"select"] forState:UIControlStateSelected];
        [_selectBtn.imageView removeFromSuperview];
    }
    return _selectBtn;
}

-(UIImageView *)imgView{
    if(!_imgView){
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 4, 4)];
    }
    return _imgView;
}

-(UILabel *)contentLable{
    if(!_contentLable){
        _contentLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 4, 4)];
        _contentLable.font = [UIFont systemFontOfSize:15];
        _contentLable.textAlignment = NSTextAlignmentCenter;
    }
    return _contentLable;
}


@end
