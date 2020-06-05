//
//  ZJMineHeadView.m
//  咩啊
//
//  Created by canoejun on 2020/5/23.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJMineHeadView.h"
#import "ZJMineModuleView.h"
#import "ZJMineHeadViewBannerModel.h"

@interface ZJMineHeadView ()
@property (nonatomic, strong, readwrite) ZJMineHeadViewBannerModel *headViewBannerModel;
@property (nonatomic, strong, readwrite) UIButton *nameLable;
@property (nonatomic, strong, readwrite) UIButton *idLabel;
@end

@implementation ZJMineHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self __setUI];
    }
    return self;
}

-(ZJMineHeadViewBannerModel *)headViewBannerModel{
    if(!_headViewBannerModel){
        _headViewBannerModel = [ZJMineHeadViewBannerModel loadDataWithLink:@"" mottoLink:@"" ];
    }
    return _headViewBannerModel;
}
-(UIButton *)nameLable{
    if(!_nameLable){
        _nameLable = self.nameLable = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nameLable setTitle:self.headViewBannerModel.name forState:UIControlStateNormal];
        [_nameLable setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _nameLable.frame = CGRectMake(0, 0, 200, 25);
        [_nameLable addTarget:self action:@selector(__changeNameAndMotto:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nameLable;
}

-(UIButton *)idLabel{
    if(!_idLabel){
        _idLabel = self.nameLable = [UIButton buttonWithType:UIButtonTypeCustom];
        [_idLabel setTitle:self.headViewBannerModel.motto forState:UIControlStateNormal];
        _idLabel.frame = CGRectMake(0, 0, 200, 25);
        [_idLabel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_idLabel addTarget:self action:@selector(__changeNameAndMotto:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _idLabel;
}

-(void)__setUI{
    //设置圆形和昵称
    UIImageView *iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    iconImageView.frame = CGRectMake(15, 40, 85, 85);
    [self addSubview:iconImageView];
    
    CGFloat left = CGRectGetMaxX(iconImageView.frame) - 20;
    self.nameLable.frame = CGRectMake(left, iconImageView.frame.origin.y + 15, 200, 25);
    [self addSubview:_nameLable];
    self.idLabel.frame = CGRectMake(left, CGRectGetMaxY(_nameLable.frame)+15, 200, 25);
    [self addSubview:_idLabel];
    
    [self layoutIfNeeded];
    [self setNeedsLayout];
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(iconImageView.frame)+25, self.frame.size.width, 120)];
    NSArray *moduleImageName =  @[@"signed",@"collection",@"history_activity",@"identity_authen"];
    NSArray *moduleName = @[@"已报名的",@"我的收藏",@"历史活动",@"身份认证"];
    
    CGFloat leftRightInterval = 15;
    CGFloat inteval = 25;
    
    CGFloat width = (self.frame.size.width - leftRightInterval * 2.0 - inteval * 3.0) / 4.0;
    CGFloat height = backView.frame.size.height;
    
    
    for (int i = 0; i < 4; i++) {
        ZJMineModuleView *view = [ZJMineModuleView moduleViewWithFrame:CGRectMake(leftRightInterval + (width+inteval) * i, 0, width, height) imageName:moduleImageName[i] moduleName:moduleName[i] state:1 << i];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__mouduleClickTap:)];
        [view addGestureRecognizer:tap];
        [backView addSubview:view];
    }
    
    [self addSubview:backView];
    
    UIView *placeHolderView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(backView.frame), self.frame.size.width, 10)];
    placeHolderView.backgroundColor = [UIColor whiteColor];
    [self addSubview:placeHolderView];
}


-(void)__changeNameAndMotto:(UITapGestureRecognizer *)tap{
//    显示更改名字和座右铭
    [self __pushNextController:@"ZJMineNameMottoViewController" model:_headViewBannerModel];
}

-(void)__mouduleClickTap:(UITapGestureRecognizer *)tap{
    ZJMineModuleView *view = (ZJMineModuleView *)tap.view;
    ModuleViewState state = view.state;
    switch (state) {
        case ModuleSigned:
//            NSLog(@"报名的");
//            ZJSignedController *vc = [[ZJSignedController alloc] init];
            [self __pushNextController:@"ZJSignedController"];
            break;
        case ModuleCollection:
//            NSLog(@"收藏");
            
            [self __pushNextController:@"ZJCollectionController"];
            break;
        case ModuleHistoryActivity:
//            NSLog(@"历史活动");
            
            [self __pushNextController:@"ZJHistoryActivityController"];
            break;
        case ModuleIdentityAuthentiation:
//            NSLog(@"认证");
            
//            [self __pushNextController:@"ZJIdentityAuthentiationController"];
            [self __identityDidClicked];
            break;
            
        default:
            break;
    }
}

-(void)__pushNextController:(NSString *)nextController{
    if([self.delegate respondsToSelector:@selector(ZJMineHeadViewModuleViewDidClicked:)]){
        [self.delegate ZJMineHeadViewModuleViewDidClicked:nextController];
    }
}
-(void)__pushNextController:(NSString *)nextController model:(id)model{
    if([self.delegate respondsToSelector:@selector(ZJMineHeadViewModuleViewDidClicked:model:)]){
        [self.delegate ZJMineHeadViewModuleViewDidClicked:nextController model:model];
    }
}

-(void)__identityDidClicked{
    if([self.delegate respondsToSelector:@selector(ZJMineHeadViewIdentityDidClicked)]){
        [self.delegate ZJMineHeadViewIdentityDidClicked];
    }
}



@end
