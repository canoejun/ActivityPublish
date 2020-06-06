//
//  ZJActivityDetailView.m
//  咩啊
//
//  Created by canoejun on 2020/5/29.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJActivityDetailView.h"
#import "ZJActivityDetailOuterModel.h"
#import "ZJActivityDetailModel.h"
#import "SDWebImage/SDWebImage.h"
#import "ZJUsersModel.h"
#import "UIImage+Color.h"

@interface ZJActivityDetailView ()
@property (nonatomic, copy, readwrite) NSString *detailLink;
@property (nonatomic, strong, readwrite) ZJActivityDetailOuterModel *model;

@property (nonatomic, strong, readwrite) UIButton *signBtn;
@property (nonatomic, strong, readwrite) UIButton *collectionBtn;


@property (nonatomic, strong, readwrite) UIImageView *imageView;
@property (nonatomic, strong, readwrite) UILabel *titleLabel;
@property (nonatomic, strong, readwrite) UILabel *detailContentLabel;
@property (nonatomic, strong, readwrite) UILabel *detailTime;
@property (nonatomic, strong, readwrite) UILabel *signTime;
@property (nonatomic, strong, readwrite) UILabel *activityTime;
@property (nonatomic, strong, readwrite) UILabel *location;
@property (nonatomic, strong, readwrite) UIImageView *hostIcon;
@property (nonatomic, strong, readwrite) UILabel *hostLable;
@end

@implementation ZJActivityDetailView

-(instancetype)initWithFrame:(CGRect)frame detailLink:(NSString *)url{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor whiteColor];
        self.detailLink = url;
        [self __setUI:frame];
    }
    return self;
}

-(ZJActivityDetailOuterModel *)model{
    if(!_model){
        _model = [[ZJActivityDetailOuterModel alloc] init];
    }
    return _model;
}

-(void)__updateUI{
    
    ZJActivityDetailModel *detailModel = self.model.activityDetailModel;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:detailModel.Post] placeholderImage:[UIImage imageNamed:@"1.jpg"]];
    self.titleLabel.text = detailModel.Title;
    self.detailContentLabel.text = detailModel.Content;
    self.detailTime.text = detailModel.Time;
    self.signTime.text = [NSString stringWithFormat:@"签到时间：%@-%@",detailModel.SignBeginTime,detailModel.SignEndTime];
    self.activityTime.text = [NSString stringWithFormat:@"正式活动：%@-%@",detailModel.BeginTime,detailModel.EndTime];
    self.location.text = detailModel.Position;
    [self.hostIcon sd_setImageWithURL:[NSURL URLWithString:detailModel.OgnIcon] placeholderImage:[UIImage imageNamed:@"1.jpg"]];
    self.hostLable.text = detailModel.OgnName;
    //    NSLog(@"%@",_model.ApplyQuantity);
    //    更新报名按钮和收藏按钮
    
    //    NSLog(@"%@  %@",[_model.userApplyState class],_model.userApplyState);
    
    if([_model.userApplyState integerValue] == 1){//已经报名了
        self.signBtn.selected = YES;
        [self.signBtn setBackgroundColor:[UIColor colorWithRed:255/255.0 green:57/255.0 blue:56/255.0 alpha:1.0]];
    }else{
        self.signBtn.selected = NO;
        [self.signBtn setBackgroundColor:[UIColor colorWithRed:255/255.0 green:210/255.0 blue:0/255.0 alpha:1.0]];
    }
//    更新收藏按钮
    NSLog(@"%@  %@",[_model.userCollectState class],_model.userCollectState);
    if([_model.userCollectState integerValue] == 1){
        self.collectionBtn.selected = YES;
        [self.collectionBtn setBackgroundColor:[UIColor colorWithRed:255/255.0 green:57/255.0 blue:56/255.0 alpha:1.0]];
    }else{
        self.collectionBtn.selected = NO;
        [self.collectionBtn setBackgroundColor:[UIColor colorWithRed:255/255.0 green:210/255.0 blue:0/255.0 alpha:1.0]];
    }
}


-(void)__setUI:(CGRect)frame{
    ZJActivityDetailModel *detailModel = self.model.activityDetailModel;
    //    添加图片
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:detailModel.Post]];
    self.imageView = imageView;
    imageView.frame = CGRectMake(0,0,frame.size.width,180);
    [self addSubview:imageView];
    
    CGFloat leftX = 20;
    CGFloat width = frame.size.width - 40;
    
    UILabel *titleLabel = [self __buildLabelWithFrame:CGRectMake(leftX, CGRectGetMaxY(imageView.frame) + 25, width, 25) text:detailModel.Content font:[UIFont fontWithName:@"PingFang SC" size: 23] textColor:[UIColor colorWithRed:1/255.0 green:1/255.0 blue:1/255.0 alpha:1.0] sizetoFit:NO];
    self.titleLabel = titleLabel;
    [self addSubview:titleLabel];
    
    
    UILabel *detailContentLabel = [self __buildLabelWithFrame:CGRectMake(leftX, CGRectGetMaxY(titleLabel.frame)+15, width, 10000) text:detailModel.Content font:[UIFont fontWithName:@"PingFang SC" size: 14] textColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] sizetoFit:YES];
    self.detailContentLabel = detailContentLabel;
    [self addSubview:detailContentLabel];
    
    UIView *timeView = [self __buildTitleViewWithFrame:CGRectMake(leftX, CGRectGetMaxY(detailContentLabel.frame)+30, width, 25) text:@"活动时间"];
    [self addSubview:timeView];
    
    CGFloat leftXX = leftX + 20 + 25;
    UILabel *detailTime = [self __buildLabelWithFrame:CGRectMake(leftXX, CGRectGetMaxY(timeView.frame)+20, width, 15) text:detailModel.Time font:[UIFont fontWithName:@"PingFang SC" size: 14] textColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0] sizetoFit:NO];
    self.detailTime = detailTime;
    [self addSubview:detailTime];
    
    UILabel *signTime = [self __buildLabelWithFrame:CGRectMake(leftXX, CGRectGetMaxY(detailTime.frame)+15, width, 15) text:[NSString stringWithFormat:@"签到时间：%@-%@",detailModel.SignBeginTime,detailModel.SignEndTime] font:[UIFont fontWithName:@"PingFang SC" size: 14] textColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0] sizetoFit:NO];
    self.signTime = signTime;
    [self addSubview:signTime];
    
    UILabel *activityTime = [self __buildLabelWithFrame:CGRectMake(leftXX, CGRectGetMaxY(signTime.frame)+15, width, 15) text:[NSString stringWithFormat:@"正式活动：%@-%@",detailModel.BeginTime,detailModel.EndTime] font:[UIFont fontWithName:@"PingFang SC" size: 14] textColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0] sizetoFit:NO];
    self.activityTime = activityTime;
    [self addSubview:activityTime];
    
    
    UIView *locationView = [self __buildTitleViewWithFrame:CGRectMake(leftX, CGRectGetMaxY(activityTime.frame)+20, width, 25) text:@"活动地址"];
    [self addSubview:locationView];
    
    UILabel *location = [self __buildLabelWithFrame:CGRectMake(leftXX, CGRectGetMaxY(locationView.frame)+15, width, 15) text:detailModel.Position font:[UIFont fontWithName:@"PingFang SC" size: 16] textColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0] sizetoFit:NO];
    self.location = location;
    [self addSubview:location];
    
    UIView *hostView = [self __buildTitleViewWithFrame:CGRectMake(leftX, CGRectGetMaxY(location.frame)+20, width, 25) text:@"主办单位"];
    [self addSubview:hostView];
    
    
    UIImageView *hostIcon  =[[UIImageView alloc] initWithFrame:CGRectMake(5+leftX, CGRectGetMaxY(hostView.frame)+15, 20, 20)];
    self.hostIcon = hostIcon;
    hostIcon.image = [UIImage imageNamed:detailModel.OgnIcon];
    [self addSubview:hostIcon];
    
    UILabel *hostLable = [self __buildLabelWithFrame:CGRectMake(CGRectGetMaxX(hostIcon.frame) + 15, CGRectGetMaxY(hostView.frame)+15, width, 20) text:detailModel.OgnName font:[UIFont fontWithName:@"Sun Yat-sen Hsingshu" size: 18] textColor:[UIColor colorWithRed:0/255.0 green:71/255.0 blue:55/255.0 alpha:1.0] sizetoFit:NO];
    self.hostLable = hostLable;
    [self addSubview:hostLable];
    
    
    CGFloat height = 55;
    //    添加报名按钮
    UIButton *signBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [signBtn setTitle:@"立即报名" forState:UIControlStateNormal];
    [signBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [signBtn setTitle:@"取消报名" forState:UIControlStateSelected];
    [signBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    
    signBtn.frame = CGRectMake(leftX, self.frame.size.height - 180, 200, height);
    signBtn.layer.cornerRadius = height * 0.5;
    [signBtn addTarget:self action:@selector(__signBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    self.signBtn = signBtn;
    [self addSubview:signBtn];
    CGFloat remainWidth = frame.size.width - CGRectGetMaxX(signBtn.frame);
    CGFloat padding = (remainWidth - 20 - 2*height)/ 2.0;
    
    //    添加分享按钮
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = CGRectMake(CGRectGetMaxX(signBtn.frame) + padding,signBtn.frame.origin.y,height,height);
    [shareBtn setBackgroundColor:[UIColor colorWithRed:255/255.0 green:210/255.0 blue:0/255.0 alpha:1.0]];
    [shareBtn setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    shareBtn.layer.cornerRadius = height * 0.5;
    [self addSubview:shareBtn];
    
    //    添加收藏按钮
    UIButton *collectionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.collectionBtn = collectionBtn;
    [collectionBtn setImage:[UIImage imageNamed:@"shoucang"] forState:UIControlStateNormal];
    [collectionBtn setBackgroundColor:[UIColor colorWithRed:255/255.0 green:210/255.0 blue:0/255.0 alpha:1.0]];
    [collectionBtn addTarget:self action:@selector(__collectBtnDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    collectionBtn.frame = CGRectMake(CGRectGetMaxX(shareBtn.frame) + padding, signBtn.frame.origin.y, height, height);
    collectionBtn.layer.cornerRadius = height * 0.5;
    [self addSubview:collectionBtn];
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [ZJActivityDetailOuterModel loadDataWithLink:@"http://47.92.93.38:443/activity/select/detail" params:@{@"activity_id":self.detailLink,@"user_id":[ZJUsersModel shareInstance].userID} success:^(id  _Nullable responseObject) {
            //            NSLog(@"%@ %@",[responseObject class],[responseObject[@"activity_detail"] class]);
            self.model = [[ZJActivityDetailOuterModel alloc] initWithDic:responseObject];
            [self __updateUI];
        } failure:^(id  _Nullable errror) {
            NSLog(@"%@",errror);
        } method:@"POST"];
    });
}

-(void)__signBtnDidClicked{
    if(self.signBtn.selected){//已经报名了，取消报名
        self.signBtn.selected = NO;
        [self.signBtn setBackgroundColor:[UIColor colorWithRed:255/255.0 green:210/255.0 blue:0/255.0 alpha:1.0]];
        [ZJActivityDetailOuterModel removeWithLink:@"http://47.92.93.38:443/apply/delete" params:@{@"user_id":[ZJUsersModel shareInstance].userID,@"activity_id":self.model.activityDetailModel.ActivityID} success:^(id  _Nullable responseObject) {
            NSLog(@"报名详情%@ %@",[responseObject class],responseObject);
        } failure:^(id  _Nullable errror) {
            NSLog(@"%@",errror);
        }];
    }else{//没报名
        if([self.detailViewDelegate respondsToSelector:@selector(signBtnDidClickedWithModel:signBtn:)]){
            [self.detailViewDelegate signBtnDidClickedWithModel:self.model.activityDetailModel signBtn:self.signBtn];
        }
    }
    
}
-(void)__collectBtnDidClicked:(UIButton *)btn{
    if(btn.selected){//如果被选中，取消收藏
        btn.selected = NO;
        [btn setBackgroundColor:[UIColor colorWithRed:255/255.0 green:210/255.0 blue:0/255.0 alpha:1.0]];
        [ZJActivityDetailOuterModel addCollectWithWithLink:@"http://47.92.93.38:443/collect/delete" params:@{@"user_id":[ZJUsersModel shareInstance].userID,@"activity_id":self.model.activityDetailModel.ActivityID} success:^(id  _Nullable responseObject) {
            NSLog(@"%@收藏了%@",self.model.activityDetailModel.ActivityID,responseObject);
        } failure:^(id  _Nullable errror) {
            NSLog(@"%@",errror);
        }];
    }else{//没有被选中，进行收藏
        btn.selected = YES;
        [btn setBackgroundColor:[UIColor colorWithRed:255/255.0 green:57/255.0 blue:56/255.0 alpha:0.1]];
        [ZJActivityDetailOuterModel removeWithLink:@"http://47.92.93.38:443/collect/create" params:@{@"user_id":[ZJUsersModel shareInstance].userID,@"activity_id":self.model.activityDetailModel.ActivityID} success:^(id  _Nullable responseObject) {
            NSLog(@"%@收藏删除%@",self.model.activityDetailModel.ActivityID,responseObject);
        } failure:^(id  _Nullable errror) {
            NSLog(@"%@",errror);
        }];
    }
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

-(UIView *)__buildTitleViewWithFrame:(CGRect)frame text:(NSString *)text{
    UIView *backView = [[UIView alloc] initWithFrame:frame];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_icon"]];
    imageView.frame = CGRectMake(0, 0, backView.frame.size.height, frame.size.height);
    imageView.layer.cornerRadius = 8;
    [backView addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame)+15, 0, 80, backView.frame.size.height)];
    label.text = text;
    label.font = [UIFont fontWithName:@"PingFang SC" size: 17];
    label.textColor =[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    [backView addSubview:label];
    
    return backView;
}


@end
