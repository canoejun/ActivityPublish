//
//  ZJHistoryView.m
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJHistoryView.h"
#import "ZJCollectionModel.h"
#import "ZJBaseDataSource.h"
#import "ZJCollectionCell.h"
#import "ZJUsersModel.h"

@interface ZJHistoryView ()<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong, readwrite) UIView *imageView;
@property (nonatomic, strong, readwrite) UICollectionView *collectionView;
@property (nonatomic, strong, readwrite) ZJBaseDataSource *dataSource;

@end

static NSString * const reusedID = @"ZJHistory";

@implementation ZJHistoryView
-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self addSubview:self.imageView];
        [self addSubview:self.collectionView];
        [self __setUI];
        [self addObserver:self forKeyPath:@"showSelect" options:NSKeyValueObservingOptionNew context:nil];
        [self __updateData];
    }
    return self;
}

-(void)__setUI{
    if(!self.dataSource.dataArray || self.dataSource.dataArray.count <= 0){
        self.collectionView.hidden = YES;
        self.imageView.hidden = NO;
    }else{
        self.collectionView.hidden = NO;
        self.imageView.hidden = YES;
    }
}

-(void)__updateData{
    NSString *link = @"http://47.92.93.38:443/apply/history";
    [ZJCollectionModel loadDataWithLink:link params:@{@"user_id":[ZJUsersModel shareInstance].userid} success:^(id  _Nullable responseObject) {
        //        ZJSignedModel
        NSArray *dataArray = [ZJCollectionModel loadDataWith:responseObject picLink:@""];
        [self.dataSource addDataArray:dataArray];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
            [self __setUI];
        });
//        [self.collectionView reloadData];
//        [self __setUI];
    } failure:^(id  _Nullable errror) {
        NSLog(@"%@",errror);
    } method:@"POST"];
}


#pragma mark ---------------------delegate------------------------------
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.collectionView.frame.size.width * 0.5, 140);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.f;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.f;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ZJCollectionCell *cell = (ZJCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //        点击进行cell，进行界面的切换
    if([self.delegate respondsToSelector:@selector(historyViewCellDidClickedNextController:detailLink:)]){
        [self.delegate historyViewCellDidClickedNextController:@"ZJActivityDetailViewController" detailLink:cell.model.activityID];
    }
}

#pragma mark ---------------------lazyLoad------------------------------
- (UIView *)imageView{
    if(!_imageView){
        self.imageView = [[UIView alloc] initWithFrame:self.frame];
        _imageView.backgroundColor = [UIColor whiteColor];
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 95)];
        imageV.image = [UIImage imageNamed:@"history_default"];
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

-(UICollectionView *)collectionView{
    if(!_collectionView){
        self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout: [[UICollectionViewFlowLayout alloc] init]];
        
        self.collectionView.dataSource = self.dataSource;
        self.collectionView.delegate = self;
        
        self.collectionView.backgroundColor = [UIColor whiteColor];
        
        [self.collectionView registerClass:[ZJCollectionCell class] forCellWithReuseIdentifier:reusedID];
    }
    return _collectionView;
}

-(ZJBaseDataSource *)dataSource{
    if(!_dataSource){
        self.dataSource = [[ZJBaseDataSource alloc] initWithIdentity:reusedID configBlock:^(ZJCollectionCell * _Nonnull cell, id  _Nonnull model, NSIndexPath * _Nonnull indexPath) {
            cell.model = model;
        }];
    }
    return _dataSource;
    
}

@end
