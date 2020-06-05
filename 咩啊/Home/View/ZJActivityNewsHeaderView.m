//
//  ZJActivityNewsHeaderView.m
//  咩啊
//
//  Created by canoejun on 2020/5/28.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJActivityNewsHeaderView.h"
#import "ZJHomeHotActivityCell.h"
#import "ZJHomeActivityProjectCell.h"

#import "ZJHomeActivityProjectModel.h"
#import "ZJHomeUniversalModel.h"

#import "ZJMoreDetailButton.h"
#import "ZJBaseDataSource.h"

#import "ZJHomeActivityProjectView.h"

#import "ZJCache.h"

@interface ZJActivityNewsHeaderView ()<UITableViewDelegate,ZJActivityProjectViewDelegate>
@property (nonatomic, strong, readwrite) UIView *activityProject;
@property (nonatomic, strong, readwrite) UITableView *hotActivity;
@property (nonatomic, strong, readwrite) UIView *lineView;
@property (nonatomic, strong, readwrite) UIButton *selectedBtn;
@property (nonatomic, strong, readwrite) UIView *backView;
@property (nonatomic, strong, readwrite) ZJHomeActivityProjectView *projectView;
@property (nonatomic, strong, readwrite) ZJBaseDataSource *activityProjectDataSource;
@property (nonatomic, strong, readwrite) ZJBaseDataSource *hotActivityDataSource;
@end

static NSString *const hotReusedID = @"hotActivity";

@implementation ZJActivityNewsHeaderView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self __setUIWithFrame:frame];
    }
    return self;
}

#pragma---------------------privateMethod------------------------------

- (void)__setUIWithFrame:(CGRect)frame {
    //    活动专题
    [self addSubview:self.activityProject];
    //    添加最热活动 tableview
    [self addSubview:self.hotActivity];
    
    [self addSubview:self.backView];
    
    CGFloat maxY = CGRectGetMaxY(self.backView.frame);
    self.frame = CGRectMake(0, 0., self.frame.size.width, maxY+5);
    
    [self __loadActivityData];
    
}


-(void)__loadActivityData{
    
    NSString *link = @"http://47.92.93.38:8080/activity/select/hot";
    //    加载最热活动
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [ZJHomeUniversalModel loadDataWithLink:link success:^(id  _Nullable responseObject) {
            NSArray *dataArray = [NSArray array];
            if([responseObject isKindOfClass:[NSArray class]]){
                dataArray = responseObject;
            }//可能还存在其他的字典类型
            
            NSArray *array =[ZJHomeUniversalModel loadDataWith:dataArray picLink:link];
            NSMutableArray *lessArray = [NSMutableArray array];
            while (lessArray.count < 3)
                [lessArray addObject:array[lessArray.count]];
            [self.hotActivityDataSource addDataArray:lessArray];
            [self.hotActivity reloadData];
        } failure:^(id  _Nullable errror) {
            NSLog(@"%@",errror);
        }];
    });
    
    //    加载活动专题的数据
    
    link = @"http://47.92.93.38:8080/class/select";
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [ZJHomeActivityProjectModel loadDataWithLink:link success:^(id  _Nullable responseObject) {
            //            NSLog(@"专题：%@ %@",[responseObject class],responseObject);
            NSArray *dataArray = [ZJHomeActivityProjectModel loadDataWith:responseObject picLink:link];
            [self.activityProjectDataSource addDataArray:dataArray];
            [self.projectView reloadData];
            //            self.activityProject
        } failure:^(id  _Nullable errror) {
            NSLog(@"%@",errror);
        }];
    });
    
    
}


- (void)__titleBtnDidClicked:(UIButton *)btn {
    if (_selectedBtn == btn) return;
    //    选中的是其他的按钮
    //    取消当前按钮
    [UIView animateWithDuration:0.3 animations:^{
        self.selectedBtn.selected = NO;
        self.selectedBtn = btn;
        self.selectedBtn.selected = YES;
        //    设定选中的按钮
        //    移动lineView
        self.lineView.center = CGPointMake(self.selectedBtn.center.x, CGRectGetMaxY(self.selectedBtn.frame) + 1);
    }];
    
    
    NSString *name = btn.titleLabel.text;
    NSString *link = @"";
    if([name isEqualToString:@"最新"]){
        link = @"http://47.92.93.38:8080/activity/select/new";
    }else if ([name isEqualToString:@"校内"]){
        link = @"http://47.92.93.38:8080/activity/select/official";
    }else if ([name isEqualToString:@"社团"]){
        link = @"http://47.92.93.38:8080/activity/select/club";
    }

    [self __typeBtnClicked:link];
    
}

-(void)__typeBtnClicked:(NSString *)typeName{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [ZJHomeUniversalModel loadDataWithLink:typeName success:^(id  _Nullable responseObject) {
            NSArray *dataArray = [ZJHomeUniversalModel loadDataWith:responseObject picLink:@""];
            if([self.delegate respondsToSelector:@selector(ZJHomeHeaderViewTypeDicClicked:)]){
                [self.delegate ZJHomeHeaderViewTypeDicClicked:dataArray];
            }
        } failure:^(id  _Nullable errror) {
            NSLog(@"%@",errror);
        }];
    });
    
//    如果新的链接数据没有加载出来，先加载旧的数据
    ZJCache *cache = [ZJCache shareInstance];
    id responseObject = [cache objectForKey:typeName];
    NSArray *dataArray = [ZJHomeUniversalModel loadDataWith:responseObject picLink:@""];
    if([self.delegate respondsToSelector:@selector(ZJHomeHeaderViewTypeDicClicked:)]){
        [self.delegate ZJHomeHeaderViewTypeDicClicked:dataArray];
    }
    
}

- (void)__moreDetailShow:(UITapGestureRecognizer *)tap {
    ZJMoreDetailButton *btn = (ZJMoreDetailButton *)tap.view;
    if ([btn.textLabel.text isEqualToString:@"更多专题"]) {
        [self __pushNextController:@"ZJActivityProjectViewController" dataSource:self.activityProjectDataSource];
    } else if ([btn.textLabel.text isEqualToString:@"查看热榜"]) {
        [self __pushNextController:@"ZJHotActivityViewController" dataSource:self.hotActivityDataSource];
    }
}

- (void)__pushNextController:(NSString *)nextController dataSource:(ZJBaseDataSource *)dataSource {
    if ([self.delegate respondsToSelector:@selector(ZJHomeHeaderViewMoreDetailDidClicked:dataSource:)]) {
        [self.delegate ZJHomeHeaderViewMoreDetailDidClicked:nextController dataSource:dataSource];
    }
}
- (void)__pushNextController:(NSString *)nextController detailLink:(NSString *_Nullable)url{
    if([self.delegate respondsToSelector:@selector(ZJHomeHeaderViewCellDidClicked:detailLink:)]){
        [self.delegate ZJHomeHeaderViewCellDidClicked:nextController detailLink:url];
    }
}



#pragma---------------------delegate------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ZJHomeHotActivityCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    转到最热活动的详情界面
    [self __pushNextController:@"ZJActivityDetailViewController" detailLink:[NSString stringWithFormat:@"/activity/select/detail/%@",cell.model.activityID]];
}
-(void)activityProjectViewCellDidClicked:(UITapGestureRecognizer *)tapGesture{
    ZJHomeActivityProjectCell *cell = (ZJHomeActivityProjectCell *)tapGesture.view;
    NSLog(@"%@",cell);
    [self __pushNextController:@"ZJActivityProjectDetailViewController" detailLink:[NSString stringWithFormat:@"/class/select/detail/%@",cell.model.ClassID]];
}

#pragma---------------------lazyLoad------------------------------

- (UIView *)activityProject {
    if (!_activityProject) {
        _activityProject = [[UIView alloc] initWithFrame:CGRectMake(0, 10, self.frame.size.width, 120)];
        CGFloat height = 25;
        
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, height)];
        [_activityProject addSubview:backView];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, height)];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.text = @"活动专题";
        titleLabel.font = [UIFont systemFontOfSize:17];
        [backView addSubview:titleLabel];
        
        CGFloat width = 132;
        //        添加更多的按钮
        ZJMoreDetailButton *moreBtn = [[ZJMoreDetailButton alloc] initWithFrame:CGRectMake(backView.frame.size.width - width, 0, width, height) title:@"更多专题"];
        moreBtn.center = CGPointMake(moreBtn.center.x, titleLabel.center.y);
        [backView addSubview:moreBtn];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__moreDetailShow:)];
        [moreBtn addGestureRecognizer:tap];
        
        self.projectView = [[ZJHomeActivityProjectView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(backView.frame), backView.frame.size.width, 88) dataSource:self.activityProjectDataSource];
        self.projectView.delegate = self;
        [_activityProject addSubview:_projectView];
    }
    return _activityProject;
}

- (UITableView *)hotActivity {
    if (!_hotActivity) {
        CGFloat height = 40;
        
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, height)];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, height)];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.text = @"最热活动";
        titleLabel.font = [UIFont systemFontOfSize:17];
        [backView addSubview:titleLabel];
        
        CGFloat width = 132;
        //        添加更多的按钮
        ZJMoreDetailButton *moreBtn = [[ZJMoreDetailButton alloc] initWithFrame:CGRectMake(backView.frame.size.width - width, 0, width, height) title:@"查看热榜"];
        
        moreBtn.center = CGPointMake(moreBtn.center.x, titleLabel.center.y);
        [backView addSubview:moreBtn];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__moreDetailShow:)];
        [moreBtn addGestureRecognizer:tap];
        
        //        设置tableview
        _hotActivity = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.activityProject.frame) + 5, self.frame.size.width - 40, 200) style:UITableViewStylePlain];
        _hotActivity.delegate = self;
        _hotActivity.dataSource = self.hotActivityDataSource;
        
        _hotActivity.tableHeaderView = backView;
        _hotActivity.tableHeaderView.frame = backView.frame;
        _hotActivity.sectionHeaderHeight = backView.frame.size.height;
        _hotActivity.separatorStyle = UITableViewCellAccessoryNone;
        
        _hotActivity.showsVerticalScrollIndicator = NO;
        _hotActivity.scrollEnabled = NO;
        
        //        注册cell
        [_hotActivity registerClass:[ZJHomeHotActivityCell class] forCellReuseIdentifier:hotReusedID];
        
    }
    return _hotActivity;
}

- (UIView *)backView {
    if (!_backView) {
        CGFloat height = 25;
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.hotActivity.frame), self.frame.size.width, height + 1)];
        
        CGFloat width = _backView.frame.size.width / 4.5;
        NSArray *titleArray = @[@"最新", @"校内", @"社团"];
        for (int i = 0; i < titleArray.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(i * width - 25, 0, width, height);
            [btn setTitle:titleArray[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
            btn.titleLabel.font = [UIFont systemFontOfSize:16];
            [btn addTarget:self action:@selector(__titleBtnDidClicked:) forControlEvents:UIControlEventTouchUpInside];
            [_backView addSubview:btn];
            if (i == 0) {
                self.selectedBtn = btn;
                self.selectedBtn.selected = YES;
            }
        }
        [_backView addSubview:self.lineView];
        
        _lineView.frame = CGRectMake(0, 0, width * 0.5, 2);
        _lineView.center = CGPointMake(_selectedBtn.center.x, CGRectGetMaxY(_selectedBtn.frame) + 1);
    }
    return _backView;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 1)];
        _lineView.backgroundColor = [UIColor colorWithRed:249 / 255.0 green:195 / 255.0 blue:1 / 255.0 alpha:1.0];
    }
    return _lineView;
}

- (ZJBaseDataSource *)hotActivityDataSource {
    if (!_hotActivityDataSource) {
        _hotActivityDataSource = [[ZJBaseDataSource alloc] initWithIdentity:hotReusedID configBlock:^(ZJHomeHotActivityCell *_Nonnull cell, id _Nonnull model, NSIndexPath *_Nonnull indexPath) {
            cell.model = model;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            NSString *imageUrl = [NSString stringWithFormat:@"hot_%ld",indexPath.row+1];
            cell.imageView.image = [UIImage imageNamed:imageUrl];
        }];
    }
    return _hotActivityDataSource;
}

- (ZJBaseDataSource *)activityProjectDataSource {
    if (!_activityProjectDataSource) {
        //        NSArray *array = [ZJHomeActivityProjectModel loadData];
        _activityProjectDataSource = [[ZJBaseDataSource alloc] init];
        //        [_activityProjectDataSource addDataArray:array];
    }
    return _activityProjectDataSource;
}

@end
