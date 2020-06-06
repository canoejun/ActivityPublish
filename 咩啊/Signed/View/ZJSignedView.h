//
//  ZJSignedVIiew.h
//  咩啊
//
//  Created by canoejun on 2020/5/23.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZJSignViewDelegate <NSObject>

-(void)signViewCellDidClicked:(NSString *_Nullable)nextController detailLink:(NSString *_Nullable)url;

@end



@interface ZJSignedView : UIView
@property (nonatomic, weak, readwrite) id<ZJSignViewDelegate> delegate;
-(void)updateData;
@end

NS_ASSUME_NONNULL_END
