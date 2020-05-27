//
//  ZJHomeView.m
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJHomeView.h"
#import "ZJActivityProjectModel.h"
#import "ZJActivityProjectCell.h"
#import "ZJMoreDetailButton.h"
#import "ZJBaseDataSource.h"
#import "ZJHomeHotActivityCell.h"


@interface ZJHomeView ()<UITableViewDelegate>
@property (nonatomic, strong, readwrite) UIView *activityProject;
@property (nonatomic, strong, readwrite) UITableView *hotActivity;
@property (nonatomic, strong, readwrite) UITableView *activityNews;
@property (nonatomic, strong, readwrite) UITextField *searchView;

@property (nonatomic, strong, readwrite) ZJBaseDataSource *hotActivityDataSource;
@property (nonatomic, strong, readwrite) ZJBaseDataSource *activityNewsDataSource;
@end

static NSString *const hotReusedID = @"hotActivity";
static NSString *const newsReusedID = @"activityNews";

@implementation ZJHomeView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self __setUI];
    }
    return self;
}

-(void)__setUI{
    
    //    添加活动专题
    [self addSubview:self.activityProject];
    
    //    添加最热活动 tableview
    [self addSubview:self.hotActivity];
    
    //    添加活动新闻tableview
    [self addSubview:self.activityNews];
    
    //        添加搜索框
    [self addSubview:self.searchView];
}


#pragma ---------------------lazyLoad------------------------------
- (UIView *)activityProject{
    if(!_activityProject){
        
        _activityProject = [[UIView alloc] initWithFrame:CGRectMake(0, 130, self.frame.size.width, 120)];
        
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(20, 0, self.frame.size.width-20, 70)];
        [_activityProject addSubview:backView];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 20)];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.text = @"活动专题";
        [backView addSubview:titleLabel];
        
        CGFloat width = 70;
        //        添加更多的按钮
        ZJMoreDetailButton *moreBtn = [[ZJMoreDetailButton alloc] initWithFrame:CGRectMake(self.frame.size.width - width-45, 0, width, 20) title:@"更多专题"];
        
        moreBtn.center = CGPointMake(moreBtn.center.x, titleLabel.center.y);
        [backView addSubview:moreBtn];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__moreDetailShow:)];
        [moreBtn addGestureRecognizer:tap];
        
        
        CGFloat leftRightPadding = 20.f;
        CGFloat padding = 12.f;
        width = (self.frame.size.width - 2*leftRightPadding - 2*padding) / 3.0;
        CGFloat height = 85;
        NSArray *activityProjectDataArray = [ZJActivityProjectModel loadData];
        for (int i = 0; i < (activityProjectDataArray.count >= 3 ? 3: activityProjectDataArray.count); i++) {
            ZJActivityProjectModel *model = activityProjectDataArray[i];
            ZJActivityProjectCell *cell = [[ZJActivityProjectCell alloc] initWithFrame:CGRectMake(leftRightPadding + (padding + width) * i, CGRectGetMaxY(titleLabel.frame) + 8, width, height) title:model.title imgUrl:model.imgUrl];
            [_activityProject addSubview:cell];
        }
    }
    return _activityProject;
}

-(UITableView *)hotActivity{
    if(!_hotActivity){
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 70)];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 20)];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.text = @"最热活动";
        [backView addSubview:titleLabel];
        
        CGFloat width = 70;
        //        添加更多的按钮
        ZJMoreDetailButton *moreBtn = [[ZJMoreDetailButton alloc] initWithFrame:CGRectMake(self.frame.size.width - width-45, 0, width, 20) title:@"查看热榜"];
        
        moreBtn.center = CGPointMake(moreBtn.center.x, titleLabel.center.y);
        [backView addSubview:moreBtn];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__moreDetailShow:)];
        [moreBtn addGestureRecognizer:tap];
        
//        设置tableview
        _hotActivity = [[UITableView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.activityProject.frame), self.frame.size.width-40, 200) style:UITableViewStylePlain];
        _hotActivity.delegate = self;
        _hotActivity.dataSource = self.hotActivityDataSource;
        
        _hotActivity.tableHeaderView = backView;
        _hotActivity.tableHeaderView.frame = backView.frame;
        _hotActivity.sectionHeaderHeight = backView.frame.size.height;
        
    }
    return _hotActivity;
}

-(UITableView *)activityNews{
    if(!_activityNews){
        
    }
    return _activityNews;
}

-(ZJBaseDataSource *)hotActivityDataSource{
    if(!_hotActivityDataSource){
        _hotActivityDataSource = [[ZJBaseDataSource alloc] initWithIdentity:hotReusedID configBlock:^(ZJHomeHotActivityCell *  _Nonnull cell, id  _Nonnull model, NSIndexPath * _Nonnull indexPath) {
            cell.model = model;
        }];
    }
    return _hotActivityDataSource;
}


#pragma ---------------------privateMethod------------------------------
-(void)__moreDetailShow:(UITapGestureRecognizer *)tap{
    ZJMoreDetailButton *btn = (ZJMoreDetailButton *)tap.view;
    if([btn.textLabel.text isEqualToString:@"更多专题"]){
        [self __pushNextController:@"ZJActivityProjectViewController"];
    }else if ([btn.textLabel.text isEqualToString:@"查看热榜"]){
        [self __pushNextController:@"ZJHotActivityViewController"];
    }
}

-(void)__pushNextController:(NSString *)nextController{
    if([self.delegate respondsToSelector:@selector(ZJHomeMoreDetailDidClicked:)]){
        [self.delegate ZJHomeMoreDetailDidClicked:nextController];
    }
}


@end
