//
//  ZJHomeActivityProjectView.m
//  咩啊
//
//  Created by canoejun on 2020/6/4.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJHomeActivityProjectView.h"
#import "ZJBaseDataSource.h"
#import "ZJHomeActivityProjectModel.h"
#import "ZJHomeActivityProjectCell.h"


@interface ZJHomeActivityProjectView ()

@property (nonatomic, strong, readwrite) UIScrollView *scrollView;
@end

@implementation ZJHomeActivityProjectView

- (instancetype)initWithFrame:(CGRect)frame dataSource:(ZJBaseDataSource *)dataSource{
    self = [super initWithFrame:frame];
    if (self) {
//        [self __setUI:frame];
        self.dataSource = dataSource;
    }
    return self;
}

-(void)reloadData{
    NSLog(@"%@",[NSThread currentThread]);
    CGFloat padding = 15.f;
    CGFloat width = (self.frame.size.width - 2 * padding) / 2.0;
    CGFloat height = self.frame.size.height;
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0+ 5, self.frame.size.width, height)];
    _scrollView.showsVerticalScrollIndicator = NO;
    [self addSubview:_scrollView];

    NSInteger count = self.dataSource.dataArray.count;
    _scrollView.contentSize = CGSizeMake(width * count + (count - 1) * padding, height);
    for (int i = 0; i < (count > 3 ? 3 : count); i++) {
        ZJHomeActivityProjectModel *model = _dataSource.dataArray[i];
        ZJHomeActivityProjectCell *cell = [[ZJHomeActivityProjectCell alloc] initWithFrame:CGRectMake((padding + width) * i, 0, width, height) model:model];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__activityProjectCellDidClicked:)];
        
        [cell addGestureRecognizer:tap];
        [_scrollView addSubview:cell];
    }
}

#pragma mark mark ---------------------privateMethod------------------------------

-(void)__setUI:(CGRect)frame{
    //        添加scrollview
    [self reloadData];
}


-(void)__activityProjectCellDidClicked:(UITapGestureRecognizer *)tap{
    if([self.delegate respondsToSelector:@selector(activityProjectViewCellDidClicked:)]){
        [self.delegate activityProjectViewCellDidClicked:tap];
    }
}

#pragma mark mark ---------------------lazyLoad------------------------------
- (UIScrollView *)scrollView{
    if(!_scrollView){
        _scrollView = [[UIScrollView alloc] init];
    }
    return _scrollView;
}

@end
