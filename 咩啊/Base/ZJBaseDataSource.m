//
//  ZJBaseDataSource.m
//  咩啊
//
//  Created by canoejun on 2020/5/23.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJBaseDataSource.h"

@interface ZJBaseDataSource ()
@property (nonatomic, copy, readwrite) NSString *identity;
@property (nonatomic, copy, readwrite) configCellBlock configBlock;

@end

@implementation ZJBaseDataSource
-(id)initWithIdentity:(NSString *)identity configBlock:(configCellBlock)block{
    if(self = [super init]){
        self.identity = identity;
        self.configBlock = block;
    }
    return self;
}
-(void)addDataArray:(NSArray *)dataArray{
    if(!dataArray || dataArray.count < 0) return;
    if(dataArray.count >= 0){
        [self.dataArray removeAllObjects];
    }
    [self.dataArray addObjectsFromArray:dataArray];
}
-(void)removeData:(id)data{
    [self.dataArray removeObject:data];
}
-(id)modelAtIndexPath:(NSIndexPath *)indexPath{
    return self.dataArray.count > indexPath.row ? self.dataArray[indexPath.row] : nil;
}

#pragma ---------------------UITableViewDataSource ------------------------

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    NSLog(@"%ld",self.dataArray.count);
    return !self.dataArray.count ? 0:self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.identity forIndexPath:indexPath];
    
    id model = [self modelAtIndexPath:indexPath];
    
    if(self.configBlock){
        self.configBlock(cell, model, indexPath);
    }
    
    return cell;
}

#pragma ---------------------UICollectionViewDataSource------------------------------

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
     return !self.dataArray.count ? 0:self.dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.identity forIndexPath:indexPath];
    id model = [self modelAtIndexPath:indexPath];
    
    if(self.configBlock) {
        self.configBlock(cell, model,indexPath);
    }
    
    return cell;
}


#pragma ---------------------lazyLoad------------------------------
-(NSMutableArray *)dataArray{
    if(!_dataArray){
        self.dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


@end
