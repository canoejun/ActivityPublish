//
//  ZJActivityProjectView.m
//  咩啊
//
//  Created by canoejun on 2020/5/29.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJActivityProjectView.h"
#import "ZJBaseDataSource.h"
#import "ZJActivityProjectCell.h"
#import "ZJHomeActivityProjectModel.h"

@interface ZJActivityProjectView ()<UITableViewDelegate>
@property (nonatomic, strong, readwrite) UITableView *tableView;
@property (nonatomic, strong, readwrite) ZJBaseDataSource *dataSource;
@end

static NSString * const reusedID = @"ActProjectCell";

@implementation ZJActivityProjectView
-(instancetype)initWithFrame:(CGRect)frame dataSource:(ZJBaseDataSource *)dataSource{
    if(self = [super initWithFrame:frame]){
        [self.dataSource addDataArray:dataSource.dataArray];
        [self __setUI];
    }
    return self;
}


#pragma mark ---------------------delegate------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    将cell传递过去 变成链接传递过去
    ZJActivityProjectCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    这里创建详情的链接
    if([self.delegate respondsToSelector:@selector(activityProjectCellDidClicked:)]){
        [self.delegate activityProjectCellDidClicked:[NSString stringWithFormat:@"/class/select/detail/%@",cell.model.ClassID]];
    }
}

#pragma mark ---------------------privateMethod------------------------------
-(void)__setUI{
    [self addSubview:self.tableView];
}

#pragma mark ---------------------lazyLoad------------------------------
-(UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.delegate = self;
        _tableView.dataSource = self.dataSource;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerClass:[ZJActivityProjectCell class] forCellReuseIdentifier:reusedID];
    }
    return _tableView;
}

-(ZJBaseDataSource *)dataSource{
    if(!_dataSource){
        _dataSource = [[ZJBaseDataSource alloc] initWithIdentity:reusedID configBlock:^(ZJActivityProjectCell * _Nonnull cell, id  _Nonnull model, NSIndexPath * _Nonnull indexPath) {
            cell.model = model;
        }];
    }
    return _dataSource;
}

@end
