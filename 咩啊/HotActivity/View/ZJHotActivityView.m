//
//  ZJHotActivityView.m
//  咩啊
//
//  Created by canoejun on 2020/5/29.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJHotActivityView.h"
#import "ZJBaseDataSource.h"
#import "ZJHotActivityCell.h"
#import "ZJHomeUniversalModel.h"

@interface ZJHotActivityView ()<UITableViewDelegate>
@property (nonatomic, strong, readwrite) UITableView *tableView;
@property (nonatomic, strong, readwrite) ZJBaseDataSource *dataSource;
@end

static NSString * const reusedID = @"hotCell";

@implementation ZJHotActivityView
-(instancetype)initWithFrame:(CGRect)frame dataSource:(ZJBaseDataSource *)dataSource{
    if(self = [super initWithFrame:frame]){
        [self __setUI];
        NSString *link = @"http://47.92.93.38:8080/activity/select/hot";
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [ZJHomeUniversalModel loadDataWithLink:link success:^(id  _Nullable responseObject) {
                NSArray *dataArray = [NSArray array];
                if([responseObject isKindOfClass:[NSArray class]]){
                    dataArray = responseObject;
                }//可能还存在其他的字典类型
                NSArray *array =[ZJHomeUniversalModel loadDataWith:dataArray picLink:link];
                [self.dataSource addDataArray:array];
                [self.tableView reloadData];
            } failure:^(id  _Nullable errror) {
                NSLog(@"%@",errror);
            }];
        });
    }
    return self;
}

#pragma ---------------------delegate------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    跳转到详情界面
    ZJHotActivityCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if([self.delegate respondsToSelector:@selector(hotActivityViewCellDidClicked:detailLink:)]){
        [self.delegate hotActivityViewCellDidClicked:@"ZJActivityDetailViewController" detailLink:[NSString stringWithFormat:@"/activity/select/detail/%@",cell.model.activityID]];
    }
}

#pragma ---------------------privateMethod------------------------------
-(void)__setUI{
    [self addSubview:self.tableView];
}

#pragma ---------------------lazyLoad------------------------------
-(UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.delegate = self;
        _tableView.dataSource = self.dataSource;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerClass:[ZJHotActivityCell class] forCellReuseIdentifier:reusedID];
        
    }
    return _tableView;
}

-(ZJBaseDataSource *)dataSource{
    if(!_dataSource){
        _dataSource = [[ZJBaseDataSource alloc] initWithIdentity:reusedID configBlock:^(ZJHotActivityCell * _Nonnull cell, id  _Nonnull model, NSIndexPath * _Nonnull indexPath) {
            cell.model = model;
            [cell setRankImageWithIndexPath:indexPath];
        }];
    }
    return _dataSource;
}

@end
