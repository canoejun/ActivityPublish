//
//  ZJMineView.m
//  咩啊
//
//  Created by canoejun on 2020/5/22.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJMineView.h"
#import "ZJBaseDataSource.h"
#import "ZJMineHeadView.h"
#import "ZJLoginViewController.h"
#import "ZJBaseNavigationController.h"
#import "ZJUsersModel.h"
#import "ZJNetWorkingCache.h"

@interface ZJMineView ()<UITableViewDelegate,ZJMineHeadViewDelegate>
@property (nonatomic, strong, readwrite) ZJBaseDataSource *dataSource;
@property (nonatomic, strong, readwrite) ZJMineHeadView *headView;
@property (nonatomic, strong, readwrite) NSMutableArray *dataArray;
//@property (nonatomic, strong, readwrite) UITableView *tableView;
@end

static NSString *const reusedID = @"ZJMineView";

@implementation ZJMineView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self __setUIWithFrame:frame];
    }
    return self;
}
-(void)reload{
//    [self.tableView reloadData];
    [self.headView updateNameMotto];
}

-(void)__setUIWithFrame:(CGRect)frame{
    //    添加tableview
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    tableView.dataSource = self.dataSource;
//    self.tableView = tableView;
    tableView.delegate = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reusedID];
    [tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    tableView.separatorInset = UIEdgeInsetsMake(7, 15, 7, 15);
    [self loadData];
    
    tableView.tableHeaderView = self.headView;
    tableView.tableHeaderView.frame = self.headView.frame;
    
    [self addSubview:tableView];
}

#pragma mark ---------------------delegate------------------------------

- (void)ZJMineHeadViewModuleViewDidClicked:(NSString *)nextControllerName{
    [self __pushNextController:nextControllerName];
}
-(void)ZJMineHeadViewModuleViewDidClicked:(NSString *)nextControllerName model:(id)model{
    [self __pushNextController:nextControllerName model:model];
}
- (void)ZJMineHeadViewIdentityDidClicked {
    [self __IdentityNotOpen];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            //            NSLog(@"清除");
            [self __clearCache];
            break;
        case 1:
            //            NSLog(@"反馈");
            [self __feedBack];
            break;
        case 2:
            //            NSLog(@"关于");
            [self __pushNextController:@"ZJAboutViewController"];
            break;
        case 3:
            //            NSLog(@"退出");
            [self __logOut];
            break;
            
        default:
            break;
    }
}


#pragma mark ---------------------privateMethod------------------------------
-(void)__pushNextController:(NSString *)nextControllerName{
    if([self.delegate respondsToSelector:@selector(pushToNextController:)]){
        [self.delegate pushToNextController:nextControllerName];
    }
}
-(void)__pushNextController:(NSString *)nextControllerName model:(id)model{
    if([self.delegate respondsToSelector:@selector(pushToNextController:model:)]){
        [self.delegate pushToNextController:nextControllerName model:model];
    }
}

//显示清楚缓存成功
-(void)__clearCache{
    UIAlertController *alertVc = [self __buildAlertVcWithTitle:@"清除缓存" message:@"即将清除缓存的图片和数据！" okIsNeed:YES cancelIsNeed:YES okHandler:^(UIAlertAction *action) {
        
        NSFileManager *manager = [NSFileManager defaultManager];
        NSString *path = [NSString stringWithFormat:@"%@/Caches",NSHomeDirectory()];
        NSError *error;
        [manager removeItemAtPath:path error:&error];
        [manager removeItemAtPath:NSTemporaryDirectory() error:&error];
        
        ZJNetWorkingCache *cache = [ZJNetWorkingCache shareInstance];
        [cache clearAll];
        
    } cancelHander:nil];
    
    if([self.delegate respondsToSelector:@selector(showAlertVc:)]){
        [self.delegate showAlertVc:alertVc];
    }
}
-(void)__feedBack{
    UIAlertController *alertVc = [self __buildAlertVcWithTitle:@"反馈建议" message:@"暂不支持APP反馈，请移步210555980@qq.com邮箱进行反馈！" okIsNeed:YES cancelIsNeed:NO okHandler:nil cancelHander:nil];
    
    if([self.delegate respondsToSelector:@selector(showAlertVc:)]){
        [self.delegate showAlertVc:alertVc];
    }
}
-(void)__logOut{
    UIAlertController *alertVc = [self __buildAlertVcWithTitle:@"退出登录" message:@"即将退出当前登录用户！" okIsNeed:YES  cancelIsNeed:YES okHandler:^(UIAlertAction *action) {
        
        [ZJUsersModel logOut];
        [[ZJNetWorkingCache shareInstance] clearAll];
        
        ZJLoginViewController * loginVc = [[ZJLoginViewController alloc] init];
        ZJBaseNavigationController * nav = [[ZJBaseNavigationController alloc] initWithRootViewController:loginVc];
        [[UIApplication sharedApplication].keyWindow setRootViewController:nav];
        return;
        
    } cancelHander:^(UIAlertAction *action) {
        
    }];
    
    if([self.delegate respondsToSelector:@selector(showAlertVc:)]){
        [self.delegate showAlertVc:alertVc];
    }
}

-(void)__IdentityNotOpen{
    UIAlertController *alertVc = [self __buildAlertVcWithTitle:@"身份认证" message:@"暂未开通此项功能" okIsNeed:YES cancelIsNeed:NO okHandler:nil cancelHander:nil];
    if([self.delegate respondsToSelector:@selector(showAlertVc:)]){
        [self.delegate showAlertVc:alertVc];
    }
}


-(UIAlertController *)__buildAlertVcWithTitle:(NSString *)title
                                      message:(NSString *)message
                                     okIsNeed:(BOOL)isOk
                                 cancelIsNeed:(BOOL)isCancel
                                    okHandler:(void(^)(UIAlertAction * action))okHander
                                 cancelHander:(void(^)(UIAlertAction *action))cancelHander{
    
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if(isOk){
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:okHander];
        
        [alertVc addAction:okAction];
    }
    if(isCancel){
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:cancelHander];
        
        [alertVc addAction:cancelAction];
    }
    
    return alertVc;
}

#pragma mark ---------------------lazyLoad------------------------------
-(ZJBaseDataSource *)dataSource{
    if(!_dataSource){
        self.dataSource = [[ZJBaseDataSource alloc] initWithIdentity:reusedID configBlock:^(UITableViewCell *  _Nonnull cell, NSString * _Nonnull model, NSIndexPath * _Nonnull indexPath) {
            cell.textLabel.text = model;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }];
    }
    return _dataSource;
}

-(ZJMineHeadView *)headView{
    if(!_headView){
        self.headView = [[ZJMineHeadView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 280)];
        self.headView.delegate = self;
    }
    return _headView;
}

-(void)loadData{
    NSArray *dataArray = @[@"清除缓存",@"反馈建议",@"关于我们",@"退出登录"];
    [self.dataSource addDataArray:dataArray];
}

@end
