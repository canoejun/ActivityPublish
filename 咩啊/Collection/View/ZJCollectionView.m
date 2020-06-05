//
//  ZJCollectionView.m
//  咩啊
//
//  Created by canoejun on 2020/5/24.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJCollectionView.h"
#import "ZJCollectionModel.h"
#import "ZJBaseDataSource.h"
#import "ZJCollectionCell.h"
#import "ZJUsersModel.h"

@interface ZJCollectionView ()<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong, readwrite) UIView *imageView;
@property (nonatomic, strong, readwrite) UICollectionView *collectionView;
@property (nonatomic, strong, readwrite) ZJBaseDataSource *dataSource;
@property (nonatomic, assign, readwrite) BOOL showSelect;
@property (nonatomic, strong, readwrite) UIButton *delBtn;
@property (nonatomic, strong, readwrite) UIButton *cancelBtn;

@property (nonatomic, strong, readwrite) NSMutableArray *delArray;
@end


static NSString * const reusedID = @"ZJCollectionView";

@implementation ZJCollectionView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self addSubview:self.imageView];
        [self addSubview:self.collectionView];
        
        [self addSubview:self.delBtn];
        [self addSubview:self.cancelBtn];
        
        [self __setUI];
    }
    return self;
}

-(void)__setUI{
    
    NSArray *dataArray = [ZJCollectionModel loadCollectionData];
    if(!dataArray || dataArray.count <= 0){
        self.collectionView.hidden = YES;
        self.imageView.hidden = NO;
    }else{
        self.collectionView.hidden = NO;
        self.imageView.hidden = YES;
        [self.dataSource addDataArray:dataArray];
    }
    self.delBtn.hidden = YES;
    self.cancelBtn.hidden = YES;
    
    [self addObserver:self forKeyPath:@"showSelect" options:NSKeyValueObservingOptionNew context:nil];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    BOOL showSelectBtn = [change[@"new"] boolValue];
    
    if(showSelectBtn){//显示出来
        for (UIView *cell in self.collectionView.subviews) {
            if(![cell isKindOfClass:[ZJCollectionCell class]])continue;
            [((ZJCollectionCell *)cell) showSelectedBtn];
        }
        self.delBtn.hidden = NO;
        self.cancelBtn.hidden = NO;
    }else{
        for (UIView *cell in self.collectionView.subviews) {
            if(![cell isKindOfClass:[ZJCollectionCell class]])continue;
            [((ZJCollectionCell *)cell) hideSelectedBtn];
        }
        
        self.delBtn.hidden = YES;
        self.cancelBtn.hidden = YES;
    }
}


#pragma ---------------------delegate------------------------------
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

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if(!self.showSelect) return;
    
//    打开了选中按钮才能进行选中
    ZJCollectionCell *cell = (ZJCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    cell.selectBtn.selected = !cell.selectBtn.selected;
    
    if(cell.selectBtn.selected && ![self.delArray containsObject:cell]){
        [self.delArray addObject:cell];
    }
    if(!cell.selectBtn.selected && [self.delArray containsObject:cell]){//不选中
        [self.delArray removeObject:cell];
    }
}


#pragma ---------------------privateMethod------------------------------

-(void)__showSelectBtnLongPressGesture:(UILongPressGestureRecognizer *)longPress{
    
    if(longPress.state == UIGestureRecognizerStateBegan){
        self.showSelect = YES;
    }
}

-(void)__deleteSelectedItem{
     NSString *link = @"";
    for (ZJCollectionCell *cell in self.delArray) {
         cell.selectBtn.selected = NO;
        [self.dataSource removeData:cell.model];
        
        NSLog(@"删除收藏的数据");
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            [ZJCollectionModel removeDataWithLink:link params:@{@"phoneNumber":[ZJUsersModel shareInstance].phoneNumber,@"activity_id":cell.model.activityID} success:^(id  _Nullable responseObject) {
//                NSLog(@"%@删除了，%@",cell.model.content,responseObject);
//            } failure:^(id  _Nullable errror) {
//                NSLog(@"%@",errror);
//            }];
//        }) ;
    }
    [_collectionView reloadData];
    
    NSLog(@"删除收藏");
    
//    for (ZJCollectionCell *cell in self.delArray) {
////        NSIndexPath *indexPath = [_collectionView indexPathForCell:cell];
////        NSLog(@"%@",indexPath);
////        [_collectionView deleteItemsAtIndexPaths:@[indexPath]];
//    }
//    [_collectionView reloadData];
    
//    上传删除。  /collect/delete
   

    
    
}
-(void)__cancelSelectedItem{
    self.showSelect = NO;
    for (ZJCollectionCell *cell in self.delArray) {
         cell.selectBtn.selected = NO;
    }
}



#pragma ---------------------lazyLoad------------------------------
- (UIView *)imageView{
    if(!_imageView){
        self.imageView = [[UIView alloc] initWithFrame:self.frame];
        _imageView.backgroundColor = [UIColor whiteColor];
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 95)];
        imageV.image = [UIImage imageNamed:@"collection_default"];
        [_imageView addSubview:imageV];
        imageV.center = CGPointMake(_imageView.center.x, _imageView.center.y-20);
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageV.frame), _imageView.frame.size.width, 20)];
        label.textAlignment = NSTextAlignmentCenter;
        label.center = CGPointMake(imageV.center.x, label.center.y+10);
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor lightGrayColor];
        label.text = @"暂无收藏活动，去首页看看吧～～";
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
        
        UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(__showSelectBtnLongPressGesture:)];
        [self.collectionView addGestureRecognizer:longPressGesture];
        
    }
    return _collectionView;
}

-(ZJBaseDataSource *)dataSource{
    if(!_dataSource){
        NSLog(@"加载收藏数据");
        self.dataSource = [[ZJBaseDataSource alloc] initWithIdentity:reusedID configBlock:^(ZJCollectionCell * _Nonnull cell, id  _Nonnull model, NSIndexPath * _Nonnull indexPath) {
            cell.model = model;
        }];
    }
    return _dataSource;
    
}

-(UIButton *)delBtn{
    if(!_delBtn){
        _delBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _delBtn.frame = CGRectMake(0, self.frame.size.height - 100, 145, 55);
        [_delBtn setTitle:@"删除" forState:UIControlStateNormal];
        [_delBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _delBtn.center = CGPointMake(self.center.x - _delBtn.frame.size.width * 0.6, _delBtn.center.y);
        [_delBtn setBackgroundColor:[UIColor redColor]];
        _delBtn.layer.cornerRadius = _delBtn.frame.size.height * 0.5;
        [_delBtn addTarget:self action:@selector(__deleteSelectedItem) forControlEvents:UIControlEventTouchUpInside];
    }
    return _delBtn;
}

-(UIButton *)cancelBtn{
    if(!_cancelBtn){
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _cancelBtn.frame = CGRectMake(0, self.frame.size.height - 100, 145, 55);
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _cancelBtn.center = CGPointMake(self.center.x + _cancelBtn.frame.size.width * 0.6, _cancelBtn.center.y);
        [_cancelBtn setBackgroundColor:[UIColor lightGrayColor]];
        _cancelBtn.layer.cornerRadius = _cancelBtn.frame.size.height * 0.5;
        [_cancelBtn addTarget:self action:@selector(__cancelSelectedItem) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}

-(NSMutableArray *)delArray{
    if(!_delArray){
        _delArray = [NSMutableArray array];
    }
    return _delArray;
}


@end
