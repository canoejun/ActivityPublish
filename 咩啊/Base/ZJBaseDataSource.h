//
//  ZJBaseDataSource.h
//  咩啊
//
//  Created by canoejun on 2020/5/23.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^configCellBlock)(id cell,id model,NSIndexPath *indexPath);

@interface ZJBaseDataSource : NSObject<UITableViewDataSource,UICollectionViewDataSource>

@property (nonatomic, strong, readwrite) NSMutableArray *dataArray;

-(id)initWithIdentity:(NSString *)identity configBlock:(configCellBlock)block;
-(void)addDataArray:(NSArray *)dataArray;
-(void)removeData:(id)data;
-(id)modelAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
