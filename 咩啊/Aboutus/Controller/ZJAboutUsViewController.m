//
//  ZJAboutUsViewController.m
//  OpenZJNG
//
//  Created by 张俊 on 2019/2/22.
//

#import "ZJAboutUsViewController.h"

@interface ZJAboutUsViewController ()
/** dataArray存放cell的显示的文本信息  */
@property (nonatomic,strong) NSArray * dataArray;
@end

@implementation ZJAboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    清除多余的cell
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    self.tableView.separatorColor = [UIColor lightGrayColor];
    self.title = @"关于我们";
    
}
-(NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSArray arrayWithObjects:@"开发： canoejun",@"设计：陈彦洁",@"服务器：余泰澄",@"后端：余泰澄", nil];
    }
    return _dataArray;
}

#pragma mark mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * ID = @"aboutus";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID]; 
    }
    [cell.imageView removeFromSuperview];
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

@end
