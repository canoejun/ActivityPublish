//
//  ZJMineHeadView.m
//  咩啊
//
//  Created by canoejun on 2020/5/23.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJMineHeadView.h"
#import "ZJMineModuleView.h"

@implementation ZJMineHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
//        self.backgroundColor = [UIColor redColor];
        [self __setUI];
    }
    return self;
}
-(void)__setUI{
    //设置圆形和昵称
    UIImageView *iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon"]];
    iconImageView.frame = CGRectMake(15, 40, 70, 70);
    [self addSubview:iconImageView];
    
    UILabel *nameLable = [[UILabel alloc] init];
    nameLable.text = @"我的名字";
    nameLable.frame = CGRectMake(CGRectGetMaxX(iconImageView.frame), 40, 200, 20);
    [self addSubview:nameLable];
    
    UILabel *idLabel = [[UILabel alloc] init];
    idLabel.text = [NSString stringWithFormat:@"校园卡ID：%@",@123245];
    idLabel.frame = CGRectMake(CGRectGetMaxX(iconImageView.frame), CGRectGetMaxY(nameLable.frame)+5, 200, 25);
    [self addSubview:idLabel];
    
    [self layoutIfNeeded];
    [self setNeedsLayout];
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(iconImageView.frame)+30, self.frame.size.width, 120)];
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

-(void)__identityDidClicked{
    if([self.delegate respondsToSelector:@selector(ZJMineHeadViewIdentityDidClicked)]){
        [self.delegate ZJMineHeadViewIdentityDidClicked];
    }
}



@end
