//
//  ZJActivityProjectDetailView.m
//  咩啊
//
//  Created by canoejun on 2020/5/29.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJActivityProjectDetailView.h"
#import "ZJBaseDataSource.h"
#import "ZJActivityProjectDetailModel.h"
#import "ZJHomeActivityNewsCell.h"
#import "ZJHomeUniversalModel.h"
#import "SDWebImage/SDWebImage.h"
#import "ZJActivityDetailModuleView.h"

@interface ZJActivityProjectDetailView ()<UITableViewDelegate>
@property (nonatomic, strong, readwrite) ZJBaseDataSource *dataSource;
@property (nonatomic, copy, readwrite) NSString *detailLink;
@property (nonatomic, strong, readwrite) ZJActivityProjectDetailModel *model;
@property (nonatomic, strong, readwrite) UIView *headView;
@property (nonatomic, strong, readwrite) UITableView *tableView;

@property (nonatomic, strong, readwrite) UIImageView *imageView;
@property (nonatomic, strong, readwrite) UILabel *titleLabel;
@property (nonatomic, strong, readwrite) UILabel *detailContentLabel;
@property (nonatomic, strong, readwrite) ZJActivityDetailModuleView *browseView;
@property (nonatomic, strong, readwrite) ZJActivityDetailModuleView *joinCountView;
@property (nonatomic, strong, readwrite) ZJActivityDetailModuleView *timeRemainView;
@end

static NSString * const reusedID = @"totalCell";

@implementation ZJActivityProjectDetailView

-(instancetype)initWithFrame:(CGRect)frame detailLink:(NSString *)url{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor whiteColor];
        self.detailLink = url;
        [self __setUI:frame];
        
        //        加载专题的内容
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [ZJActivityProjectDetailModel loadDetailDataWithLink:self.detailLink success:^(id  _Nullable responseObject) {
                self.model = [[ZJActivityProjectDetailModel alloc] initWithDic:responseObject];
                [self __updateUI];
            } failure:^(id  _Nullable errror) {
                NSLog(@"%@",errror);
            }];
        });
        
        //        加载下面的全部活动数据
        NSString *link = @"http://47.92.93.38:443/activity/select/new";
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [ZJHomeUniversalModel loadDataWithLink:link success:^(id  _Nullable responseObject) {
                //            NSLog(@"活动新闻---%@ %@",[responseObject class],responseObject);
                NSArray *dataArray = [ZJHomeUniversalModel loadDataWith:responseObject picLink:link];
                [self.dataSource addDataArray:dataArray];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
                
            } failure:^(id  _Nullable errror) {
                NSLog(@"%@",errror);
            }];
        });
    }
    return self;
}

-(UIView *)headView{
    if(!_headView){
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width - 30, 380)];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.model.ClassPost]];
        self.imageView = imageView;
        imageView.frame = CGRectMake(0,5,self.frame.size.width - 30,180);
        [_headView addSubview:imageView];
        
        CGFloat leftX = 0;
        CGFloat width = self.frame.size.width - 40;
        
        UILabel *titleLabel = [self __buildLabelWithFrame:CGRectMake(leftX, CGRectGetMaxY(imageView.frame) + 25, width, 25) text:self.model.ClassName font:[UIFont fontWithName:@"PingFang SC" size: 23] textColor:[UIColor colorWithRed:1/255.0 green:1/255.0 blue:1/255.0 alpha:1.0] sizetoFit:NO];
        self.titleLabel = titleLabel;
        [_headView addSubview:titleLabel];
        
        
        UILabel *detailContentLabel = [self __buildLabelWithFrame:CGRectMake(leftX, CGRectGetMaxY(titleLabel.frame)+15, width, 10000) text:_model.ClassContent font:[UIFont fontWithName:@"PingFang SC" size: 14] textColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] sizetoFit:YES];
        self.detailContentLabel = detailContentLabel;
        [_headView addSubview:detailContentLabel];
        
        CGFloat padding = 0.f;
        CGFloat itemWidth = (width - 2*padding) / 3.0;
        
        CGFloat topY = CGRectGetMaxY(detailContentLabel.frame) + 20;
        ZJActivityDetailModuleView *browseView = [[ZJActivityDetailModuleView alloc] initWithFrame:CGRectMake(leftX,topY,itemWidth, 45) text1:@"浏览量"];
        self.browseView = browseView;
        [_headView addSubview:browseView];
        
        ZJActivityDetailModuleView *joinCountView = [[ZJActivityDetailModuleView alloc] initWithFrame:CGRectMake(leftX+(itemWidth + padding),topY,itemWidth, 45) text1:@"参加人数"];
        self.joinCountView = joinCountView;
        [_headView addSubview:joinCountView];
        
        
        ZJActivityDetailModuleView *timeRemainView = [[ZJActivityDetailModuleView alloc] initWithFrame:CGRectMake(leftX+(itemWidth + padding)*2,topY,itemWidth, 45) text1:@"截止时间"];
        self.timeRemainView = timeRemainView;
        [_headView addSubview:timeRemainView];
        
        UILabel *totalLable = [[UILabel alloc] initWithFrame:CGRectMake(leftX, CGRectGetMaxY(browseView.frame) + 20, 80, 20)];
        totalLable.text = @"全部活动";
        totalLable.font = [UIFont fontWithName:@"PingFang SC" size: 18];
        totalLable.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
        [_headView addSubview:totalLable];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(totalLable.frame)+2, totalLable.frame.size.width, 2)];
        lineView.backgroundColor = [UIColor colorWithRed:249 / 255.0 green:195 / 255.0 blue:1 / 255.0 alpha:1.0];
        
        CGFloat maxY = CGRectGetMaxY(lineView.frame);
        _headView.frame = CGRectMake(0, 0, _headView.frame.size.width, maxY + 5);
        
        [_headView addSubview:lineView];
    }
    return _headView;
}


-(ZJBaseDataSource *)dataSource{
    if(!_dataSource){
        _dataSource = [[ZJBaseDataSource alloc] initWithIdentity:reusedID configBlock:^(ZJHomeActivityNewsCell *  _Nonnull cell, id  _Nonnull model, NSIndexPath * _Nonnull indexPath) {
            cell.model = model;
        }];
//        NSLog(@"加载主页新闻数据");
        
    }
    return _dataSource;
}


-(UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(15, 0, self.bounds.size.width - 30, self.bounds.size.height) style:UITableViewStylePlain];
        _tableView.dataSource = self.dataSource;
        _tableView.delegate = self;
        
        _tableView.tableHeaderView = self.headView;
        _tableView.tableHeaderView.frame = self.headView.frame;
        _tableView.sectionHeaderHeight = self.headView.frame.size.height;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.showsVerticalScrollIndicator = NO;
        
        [_tableView registerClass:[ZJHomeActivityNewsCell class] forCellReuseIdentifier:reusedID];
        
    }
    return _tableView;
}



-(void)__setUI:(CGRect)frame{
    //    添加图片
    [self addSubview:self.tableView];
    self.tableView.frame = CGRectMake(15, 0, self.bounds.size.width - 30, self.bounds.size.height - 88);
//    NSLog(@"%f %f %f %f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
}

-(void)__updateUI{
    //    NSLog(@"%@",_model.ClassEndTime);
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:_model.ClassPost] placeholderImage:[UIImage imageNamed:@"logo.png"]];
    self.titleLabel.text = _model.ClassName;
    self.detailContentLabel.text = _model.ClassContent;
    self.browseView.detailLable.text = [NSString stringWithFormat:@"%@",_model.ClassReadQuantity];
    self.joinCountView.detailLable.text = [NSString stringWithFormat:@"%@",_model.ClassApplyQuantity];
    self.timeRemainView.detailLable.text = [_model.ClassEndTime substringToIndex:10];
}

-(ZJActivityProjectDetailModel *)model{
    if(!_model){
        _model = [[ZJActivityProjectDetailModel alloc] init];
    }
    return  _model;
}


-(UILabel *)__buildLabelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor sizetoFit:(BOOL)flag{
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:frame];
    titleLabel.text = text;
    titleLabel.numberOfLines = 0;
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = [UIColor blackColor];
    if(font){
        titleLabel.font = font;
    }
    if (textColor) {
        titleLabel.textColor = textColor;
    }
    
    if (flag) {
        CGFloat width = titleLabel.frame.size.width;     //width : UILable的宽度
        CGSize size = CGSizeMake(width, MAXFLOAT);
        CGSize textRealSize;
        textRealSize = [titleLabel.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin     attributes:@{NSFontAttributeName:font} context:nil].size;
        //改变高度
        CGRect rect = titleLabel.frame;
        rect.size.height = textRealSize.height;
        titleLabel.frame = rect;
    }
    
    return titleLabel;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    跳转
    ZJHomeActivityNewsCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if([self.detailViewDelegate respondsToSelector:@selector(activityDetailTableViewCellDidClicked:detailLink:)]){
        [self.detailViewDelegate activityDetailTableViewCellDidClicked:@"ZJActivityDetailViewController" detailLink:cell.model.activityID];
    }
}

@end
