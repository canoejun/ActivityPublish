//
//  ZJHotActivityCell.m
//  咩啊
//
//  Created by canoejun on 2020/5/29.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJHotActivityCell.h"
#import "ZJHomeUniversalModel.h"
#import "Masonry/Masonry.h"
#import "SDWebImage/SDWebImage.h"

@interface ZJHotActivityCell ()
@property (nonatomic, strong, readwrite) UILabel *titleLabel;
//举办单位
@property (nonatomic, strong, readwrite) UILabel *hostUnitLabel;
//参加的人数
@property (nonatomic, strong, readwrite) UILabel *joinPeopleCountLabel;
//活动图片
@property (nonatomic, strong, readwrite) UIImageView *activityImage;
//小图标
@property (nonatomic, strong, readwrite) UIImageView *littleImage;

@property (nonatomic, strong, readwrite) UIImageView *rankImage;
@end

@implementation ZJHotActivityCell

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
    
    [_activityImage sd_setImageWithURL:[NSURL URLWithString:model.activityImageUrl] placeholderImage:[UIImage imageNamed:@"logo.png"]];
    [_littleImage sd_setImageWithURL:[NSURL URLWithString:model.hostIconUrl] placeholderImage:[UIImage imageNamed:@"logo.png"]];
    
    
}
-(void)setRankImageWithIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row < 3){
        _rankImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"hot_act_%ld",indexPath.row+1]];
    }else{
        _rankImage.image = [self __imageWithColor:[UIColor clearColor] size:CGSizeMake(25, 25) text:[NSString stringWithFormat:@"%ld",(indexPath.row + 1)] textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor lightGrayColor]} circular:YES];
    }
}
#pragma ---------------------privateMethod------------------------------

-(void)__setUI{
    [self.contentView addSubview:self.activityImage];
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.hostUnitLabel];
    [self.contentView addSubview:self.joinPeopleCountLabel];
    [self.contentView addSubview:self.littleImage];
    [self.contentView addSubview:self.rankImage];
    
    //    布局
    
    [self.activityImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(15);
//        make.width.equalTo(@120);
        make.height.equalTo(@80);
        make.width.equalTo(self.activityImage.mas_height).multipliedBy(400.0/191.0);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.activityImage);
        make.left.equalTo(self.activityImage.mas_right).offset(15);
        make.height.equalTo(@40);
        make.width.equalTo(@170);
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
        make.bottom.equalTo(self.contentView).offset(-15);
    }];
    
    [self.rankImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.activityImage);
        make.right.equalTo(self.contentView).offset(-15);
        make.width.height.equalTo(@25);
    }];
}

/**
 绘制图片
 
 @param color 背景色
 @param size 大小
 @param text 文字
 @param textAttributes 字体设置
 @param isCircular 是否圆形
 @return 图片
 */

-(UIImage *)__imageWithColor:(UIColor *)color
                        size:(CGSize)size
                        text:(NSString *)text
              textAttributes:(NSDictionary *)textAttributes
                    circular:(BOOL)isCircular
{
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // circular
    if (isCircular) {
        CGPathRef path = CGPathCreateWithEllipseInRect(rect, NULL);
        CGContextAddPath(context, path);
        CGContextClip(context);
        CGPathRelease(path);
    }
    
    // color
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    // text
    CGSize textSize = [text sizeWithAttributes:textAttributes];
    [text drawInRect:CGRectMake((size.width - textSize.width) / 2, (size.height - textSize.height) / 2, textSize.width, textSize.height) withAttributes:textAttributes];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
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
    }
    return _activityImage;
}

-(UIImageView *)littleImage{
    if(!_littleImage){
        _littleImage = [[UIImageView alloc] init];
    }
    return _littleImage;
}
-(UIImageView *)rankImage{
    if(!_rankImage){
        _rankImage = [[UIImageView alloc] init];
    }
    return _rankImage;
}
@end
