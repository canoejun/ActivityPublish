//
//  ZJAboutModel.h
//  OpenZJNG
//
//  Created by 张俊 on 2019/2/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJAboutModel : NSObject
/** symbol  */
@property (nonatomic,copy) NSString * symbol;
/** content  */
@property (nonatomic,copy) NSString * content;
/** controller  */
@property (nonatomic,copy) NSString * controller;

+(NSArray *)loadDataWithFile:(NSString *)fileName;
@end

NS_ASSUME_NONNULL_END
