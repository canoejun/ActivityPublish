//
//  ZJHomeHotActivityCellTableViewCell.m
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import "ZJHomeHotActivityCell.h"
#import "ZJHomeUniversalModel.h"

@implementation ZJHomeHotActivityCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier]){
        self.textLabel.font = [UIFont systemFontOfSize:15];
        self.detailTextLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        self.detailTextLabel.font = [UIFont systemFontOfSize:10];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.contentView.center = CGPointMake(self.contentView.center.x - 15, self.contentView.center.y);
    self.detailTextLabel.center = CGPointMake(self.detailTextLabel.center.x, self.detailTextLabel.center.y + 5);

}

-(void)setModel:(ZJHomeUniversalModel *)model{
    _model = model;
    NSLog(@"%@",model.activityImageUrl);
    self.imageView.image = [UIImage imageNamed:model.activityImageUrl];
    self.textLabel.text = [NSString stringWithFormat:@"#%@",model.title];
    self.detailTextLabel.text = [NSString stringWithFormat:@"已有%@人参加",model.joinPeopleCount];
    
}



@end
