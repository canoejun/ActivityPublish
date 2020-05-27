//
//  ZJCollectionModel.h
//  咩啊
//
//  Created by canoejun on 2020/5/24.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJCollectionModel : NSObject

//图片地址
@property (nonatomic, copy, readwrite) NSString *imgUrl;

//文字
@property (nonatomic, copy, readwrite) NSString *content;

//按钮的选中状态
@property (nonatomic, assign, readwrite, getter=isSelected) BOOL selected;




+(NSArray *)loadCollectionData;

-(instancetype)initWithDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
