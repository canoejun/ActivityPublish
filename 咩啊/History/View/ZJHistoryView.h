//
//  ZJHistoryView.h
//  咩啊
//
//  Created by canoejun on 2020/5/26.
//  Copyright © 2020 canoejun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZJHistoryViewDelegate <NSObject>

-(void)historyViewCellDidClickedNextController:(NSString *_Nullable)nextController detailLink:(NSString *_Nullable)url;

@end

@interface ZJHistoryView : UIView
@property (nonatomic, weak, readwrite) id<ZJHistoryViewDelegate> delegate;
-(void)updateData;
@end

NS_ASSUME_NONNULL_END
