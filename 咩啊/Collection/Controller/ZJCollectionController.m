//
//  ZJCollectionController.m
//  咩啊
//
//  Created by canoejun on 2020/5/22.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJCollectionController.h"
#import "ZJCollectionView.h"
#import "ZJBaseDetailViewController.h"

@interface ZJCollectionController ()<ZJCollectionViewDelegate>
//@property (nonatomic, strong, readwrite) ZJCollectionView *collectionView;
@end

@implementation ZJCollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的收藏";
    self.view.backgroundColor = [UIColor whiteColor];
    ZJCollectionView *view = [[ZJCollectionView alloc] initWithFrame:self.view.bounds];
//    self.collectionView = view;
    self.view = view;
    view.delegate = self;
    
}



-(void)collectionViewCellDidClickedNextController:(NSString *)nextController detailLink:(NSString *)url{
        Class cls = NSClassFromString(nextController);
        ZJBaseDetailViewController *vc = [[cls alloc] init];
        vc.url = url;
        [self.navigationController pushViewController:vc animated:YES];
}
@end
