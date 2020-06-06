//
//  ZJMineNameMottoView.m
//  咩啊
//
//  Created by canoejun on 2020/5/30.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJMineNameMottoView.h"
#import "ZJMineNameMottoCell.h"
#import "ZJBaseDataSource.h"
#import "ZJMineNameMottoModel.h"
#import "ZJMineHeadViewBannerModel.h"

@interface ZJMineNameMottoView ()<UITableViewDelegate>
@property (nonatomic, strong, readwrite) UITableView *tableView;
@property (nonatomic, strong, readwrite) ZJBaseDataSource *dataSource;
@property (nonatomic, strong, readwrite) id model;
@end

static NSString * const reusedID = @"nameMottoCell";

@implementation ZJMineNameMottoView

-(instancetype)initWithFrame:(CGRect)frame model:(id)model{
    if(self = [super initWithFrame:frame]){
        self.model = model;
        [self __setUI];
    }
    return self;
}

-(UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
        [_tableView registerClass:[ZJMineNameMottoCell class] forCellReuseIdentifier:reusedID];
        
        _tableView.dataSource = self.dataSource;
        _tableView.delegate = self;
        _tableView.separatorInset = UIEdgeInsetsMake(7, 15, 7, 15);
        
        [_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
        
    }
    return _tableView;
}

-(ZJBaseDataSource *)dataSource{
    if(!_dataSource){
        _dataSource = [[ZJBaseDataSource alloc] initWithIdentity:reusedID configBlock:^(ZJMineNameMottoCell * _Nonnull cell, ZJMineNameMottoModel * _Nonnull model, NSIndexPath * _Nonnull indexPath) {
            cell.remindLabel.text = model.remind;
            cell.contentLabel.text = model.content;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }];
        [self __loadData];
    }
    return _dataSource;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"更改昵称和座右铭"
                                                                   message:@"请输入新的昵称和座右铭"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * action) {
        //        更改模型数据，上传
        ZJMineHeadViewBannerModel *model = [[ZJMineHeadViewBannerModel alloc] init];
        //响应事件
        //得到文本信息
        for(UITextField *text in alert.textFields){
            if(text.text.length <= 0) continue;
            if([text.placeholder isEqualToString:@"昵称"]){
                model.name = text.text;
            }else if([text.placeholder isEqualToString:@"座右铭"]){
                model.motto = text.text;
            }
        }
        
        self.model = model;
        [self __loadData];
        [self.tableView reloadData];
//        上传数据，切换上个界面
        if([self.delegate respondsToSelector:@selector(updateNameMottoModel:)]){
            [self.delegate updateNameMottoModel:model];
        }
    }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
        //响应事件
        NSLog(@"action = %@", alert.textFields);
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"昵称";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"座右铭";
    }];
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    
    if([self.delegate respondsToSelector:@selector(showAlertVc:)]){
        [self.delegate showAlertVc:alert];
    }
    
}


-(void)__setUI{
    [self addSubview:self.tableView];
}

-(void)__loadData{
    NSArray *array = [ZJMineNameMottoModel loadDataWithModel:(ZJMineHeadViewBannerModel *)self.model];
    [_dataSource addDataArray:array];
}

@end
