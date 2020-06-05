//
//  ZJMineModuleView.m
//  咩啊
//
//  Created by canoejun on 2020/5/22.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJMineModuleView.h"
#import "Masonry/Masonry.h"


@implementation ZJMineModuleView

+(ZJMineModuleView *)moduleViewWithFrame:(CGRect)frame imageName:(NSString *)imageName moduleName:(NSString *)moduleName state:(ModuleViewState)state{
    return [[ZJMineModuleView alloc] initWithFrame:frame imageName:imageName moduleName:moduleName state:state ratio:0.6];
}

-(ZJMineModuleView *)initWithFrame:(CGRect)frame imageName:(NSString *)imageName moduleName:(NSString *)moduleName state:(ModuleViewState)state ratio:(CGFloat)ratio{
    
    ZJMineModuleView *backView = [[ZJMineModuleView alloc] initWithFrame:frame];
    
    self.imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    
    //    imageView.backgroundColor = [UIColor blueColor];
    _imgView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height*ratio);
    self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_imgView.frame), frame.size.width, frame.size.height*(1-ratio))];
    
    _contentLabel.text = moduleName;
    
    _contentLabel.font = [UIFont systemFontOfSize:15];
    _contentLabel.textAlignment = NSTextAlignmentCenter;
    
    [backView addSubview:_imgView];
    [backView addSubview:_contentLabel];
    
    backView.state = state;
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@45);
        make.centerX.equalTo(backView.mas_centerX);
        make.centerY.equalTo(backView.mas_centerY).offset(-20);
    }];
    
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(backView);
        make.height.equalTo(backView).multipliedBy(1- ratio);
    }];
    
    
    return backView;
}

-(void)updateText:(NSString *)text{
    self.contentLabel.text = text;
}



@end
