//
//  ZJAboutViewController.m
//  OpenZJNG
//
//  Created by 张俊 on 2019/2/20.
//

#import "ZJAboutViewController.h"
#import "ZJAboutHeaderView.h"
#import "ZJAboutModel.h"
#import "ZJUpdateLogViewController.h"
#import "ZJAboutUsViewController.h"
#import "Masonry.h"
#import "ZJBaseDataSource.h"

@interface ZJAboutViewController ()<UITableViewDelegate>
@property (nonatomic, strong, readwrite) ZJBaseDataSource *dataSource;
@property (nonatomic, strong, readwrite) UITableView *tableView;
@end

static NSString * const reusedID = @"aboutView";

@implementation ZJAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"关于";
    //    清除多余的cell
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    
    [self setUpBottom];
}

//设置底部的开源协会
-(void)setUpBottom {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-90, self.view.frame.size.width, 30)];
    label.numberOfLines = 0;
    [self.view addSubview:label];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"Copyright©2020 西南大学开源协会\nAll rights reserved" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang-SC-Medium" size: 10],NSForegroundColorAttributeName: [UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1.0]}];
    label.attributedText = string;
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    ZJAboutModel * ZJAbout = [_dataSource modelAtIndexPath:indexPath];

    NSInteger symbol = ZJAbout.symbol.integerValue;
    if (symbol != 0) {
        UIViewController * vc ;
        if ([ZJAbout.controller isEqualToString:@"AUS"]) {
            vc = [[ZJAboutUsViewController alloc] init];
        } else if ([ZJAbout.controller isEqualToString:@"AUL"]) {
            vc = [ZJUpdateLogViewController new];
        }
        [self.navigationController pushViewController:vc animated:YES];
    }else {

        UIAlertController * alert = [UIAlertController alertControllerWithTitle:NULL message:@"检测到新版本,是否立即更新?" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alert addAction:okAction];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:true completion:nil];
    }
}


-(ZJBaseDataSource *)dataSource{
    if(!_dataSource){
        _dataSource = [[ZJBaseDataSource alloc] initWithIdentity:reusedID configBlock:^(UITableViewCell *  _Nonnull cell, ZJAboutModel *  _Nonnull model, NSIndexPath * _Nonnull indexPath) {
            cell.textLabel.text = model.content;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }];
        NSArray *dataArray = [ZJAboutModel loadDataWithFile:@"About"];
        [_dataSource addDataArray:dataArray];
    }
    return _dataSource;
}


-(UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
        _tableView.separatorColor = [UIColor lightGrayColor];
        _tableView.separatorInset = UIEdgeInsetsMake(7, 15, 7, 15);
        _tableView.delegate = self;
        _tableView.dataSource = self.dataSource;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reusedID];
        
        ZJAboutHeaderView *headerView = [[ZJAboutHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
        _tableView.tableHeaderView = headerView;
        _tableView.tableHeaderView.frame = headerView.frame;
        _tableView.sectionHeaderHeight = headerView.frame.size.height;
        
    }
    return _tableView;
}


@end
