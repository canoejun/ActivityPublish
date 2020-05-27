//
//  ZJSignedVIiew.m
//  咩啊
//
//  Created by canoejun on 2020/5/23.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJSignedView.h"
#import "ZJSignedModel.h"
#import "ZJBaseDataSource.h"
#import "ZJSignedCell.h"


@interface ZJSignedView ()<UITableViewDelegate>
@property (nonatomic, strong, readwrite) UIView *imageView;
@property (nonatomic, strong, readwrite) UITableView *tableView;
@property (nonatomic, strong, readwrite) ZJBaseDataSource *dataSource;
@end

static NSString *reusedID = @"ZJSignedView";

@implementation ZJSignedView
-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self addSubview:self.imageView];
        [self addSubview:self.tableView];
        [self __setUI];
    }
    return self;
}

-(void)__setUI{
    
    NSArray *dataArray = [ZJSignedModel loadSignedData];
    if(!dataArray || dataArray.count <= 0){
        self.tableView.hidden = YES;
        self.imageView.hidden = NO;
    }else{
        self.tableView.hidden = NO;
        self.imageView.hidden = YES;
        [self.dataSource addDataArray:dataArray];
    }

}

#pragma ---------------------UITableViewDelegate------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma ---------------------lazyLoad------------------------------
- (UIView *)imageView{
    if(!_imageView){
        self.imageView = [[UIView alloc] initWithFrame:self.frame];
        _imageView.backgroundColor = [UIColor whiteColor];
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 105)];
        imageV.image = [UIImage imageNamed:@"sign_default"];
        [_imageView addSubview:imageV];
        imageV.center = CGPointMake(_imageView.center.x, _imageView.center.y-20);
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageV.frame), _imageView.frame.size.width, 20)];
        label.textAlignment = NSTextAlignmentCenter;
        label.center = CGPointMake(imageV.center.x, label.center.y+10);
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor lightGrayColor];
        label.text = @"暂无历史活动，快去参加吧～～";
        [_imageView addSubview:label];
    }
    return _imageView;
}

-(UITableView *)tableView{
    if(!_tableView){
        self.tableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
        self.tableView.dataSource = self.dataSource;
        self.tableView.delegate = self;
        [self.tableView registerClass:[ZJSignedCell class] forCellReuseIdentifier:reusedID];
        self.tableView.estimatedRowHeight = 130;
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

-(ZJBaseDataSource *)dataSource{
    if(!_dataSource){
        self.dataSource = [[ZJBaseDataSource alloc] initWithIdentity:reusedID configBlock:^(ZJSignedCell * _Nonnull cell, id  _Nonnull model, NSIndexPath * _Nonnull indexPath) {
            cell.model = model;
        }];
    }
    return _dataSource;
    
}


@end
