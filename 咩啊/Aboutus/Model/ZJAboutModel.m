//
//  ZJAboutModel.m
//  OpenZJNG
//
//  Created by 张俊 on 2019/2/22.
//

#import "ZJAboutModel.h"

@implementation ZJAboutModel

+(NSArray *)loadDataWithFile:(NSString *)fileName{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePath];
    
    NSMutableArray *dataArray = [NSMutableArray array];
    for (int i = 0; i < array.count; i++) {
        NSDictionary *dic = array[i];
        ZJAboutModel *model = [[ZJAboutModel alloc] initWithDic:dic];
        [dataArray addObject:model];
    }
    return dataArray;
}

-(instancetype)initWithDic:(NSDictionary *)dic{
    if(self = [super init]){
        self.symbol = dic[@"symbol"];
        self.content = dic[@"content"];
        self.controller = dic[@"controller"];
    }
    return self;
}

@end
