//
//  ZJHomeView.m
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJHomeView.h"

#import "ZJHomeUniversalModel.h"
#import "ZJHomeActivityNewsCell.h"

#import "ZJBaseDataSource.h"
#import "ZJActivityNewsHeaderView.h"



@interface ZJHomeView ()<UITableViewDelegate,ZJHomeHeaderViewDelegate,UIScrollViewDelegate>

@property (nonatomic, strong, readwrite) UITableView *activityNews;
@property (nonatomic, strong, readwrite) UITextField *searchView;

@property (nonatomic, strong, readwrite) ZJBaseDataSource *activityNewsDataSource;

@end

static NSString *const newsReusedID = @"activityNews";

@implementation ZJHomeView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self __setUI];
    }
    return self;
}


#pragma ---------------------privateMethod------------------------------

-(void)__pushNextController:(NSString *)nextController dataSource:(ZJBaseDataSource *)dataSource{
    if([self.delegate respondsToSelector:@selector(ZJHomeMoreDetailDidClicked: dataSource:)]){
        [self.delegate ZJHomeMoreDetailDidClicked:nextController dataSource:dataSource];
    }
}

-(void)__pushNextController:(NSString *)nextController detailLink:(NSString *)url{
    if([self.delegate respondsToSelector:@selector(ZJHomeCellDidClicked:detailLink:)]){
        [self.delegate ZJHomeCellDidClicked:nextController detailLink:url];
    }
}


-(void)__setUI{
    
    //    添加活动新闻tableview
    [self addSubview:self.activityNews];
    
    //        添加搜索框
//    [self addSubview:self.searchView];
    
    NSString *link = @"http://47.92.93.38:8080/activity/select/new";
//    加载主页新闻数据
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [ZJHomeUniversalModel loadDataWithLink:link success:^(id  _Nullable responseObject) {
            NSLog(@"活动新闻---%@ %@",[responseObject class],responseObject);
            NSArray *dataArray = [ZJHomeUniversalModel loadDataWith:responseObject picLink:link];
            [self.activityNewsDataSource addDataArray:dataArray];
            [self.activityNews reloadData];
        } failure:^(id  _Nullable errror) {
            NSLog(@"%@",errror);
        }];
    });

}

#pragma ---------------------delegate------------------------------
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ZJHomeActivityNewsCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [self __pushNextController:@"ZJActivityDetailViewController" detailLink:[NSString stringWithFormat:@"/activity/select/detail/%@",cell.model.activityID]];
}

-(void)ZJHomeHeaderViewMoreDetailDidClicked:(NSString *)nextControllerName dataSource:(ZJBaseDataSource *)dataSource{
    [self __pushNextController:nextControllerName dataSource:dataSource];
}

-(void)ZJHomeHeaderViewCellDidClicked:(NSString *)nextControllerName detailLink:(NSString *)url{
    [self __pushNextController:nextControllerName detailLink:url];
}

- (void)ZJHomeHeaderViewTypeDicClicked:(NSArray *)dataArray{
    [self.activityNewsDataSource addDataArray:dataArray];
    [self.activityNews reloadData];
}


#pragma mark ---------------------lazyLoad------------------------------


-(UITableView *)activityNews{
    if(!_activityNews){
        ZJActivityNewsHeaderView *headerView = [[ZJActivityNewsHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 400)];
        headerView.delegate = self;
        
        //        设置tableview
        _activityNews = [[UITableView alloc] initWithFrame:CGRectMake(20, 0, self.frame.size.width-40, self.frame.size.height) style:UITableViewStylePlain];
        _activityNews.delegate = self;
        _activityNews.dataSource = self.activityNewsDataSource;
        _activityNews.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

        _activityNews.tableHeaderView = headerView;
        _activityNews.tableHeaderView.frame = headerView.frame;
        _activityNews.sectionHeaderHeight = headerView.frame.size.height;
        _activityNews.showsHorizontalScrollIndicator = NO;
        _activityNews.showsVerticalScrollIndicator = NO;
        _activityNews.separatorInset = UIEdgeInsetsMake(7, 0, 7, 0);

        //        注册cell
        [_activityNews registerClass:[ZJHomeActivityNewsCell class] forCellReuseIdentifier:newsReusedID];
    }
    return _activityNews;
}

-(ZJBaseDataSource *)activityNewsDataSource{
    if(!_activityNewsDataSource){
        _activityNewsDataSource = [[ZJBaseDataSource alloc] initWithIdentity:newsReusedID configBlock:^(ZJHomeActivityNewsCell * _Nonnull cell, id  _Nonnull model, NSIndexPath * _Nonnull indexPath) {
            cell.model = model;
        }];
    }
    return _activityNewsDataSource;
}






@end
