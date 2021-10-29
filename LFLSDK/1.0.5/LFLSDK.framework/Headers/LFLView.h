//
//  LFLView.h
//  LFLSDK
//
//  Created by laole918 on 2021/8/13.
//

#import <UIKit/UIKit.h>
#import "LFLSDKManager.h"

NS_ASSUME_NONNULL_BEGIN

@class LFLView;

@protocol LFLViewDelegate <NSObject>
@optional
- (void)lfl_lflViewDidClose:(LFLView *) lflView;
- (void)lfl_lflViewDidCallCustomTask:(LFLView *) lflView customTask:(LFLCustomTaskType) customTask;
@end

@interface LFLView : UIView
@property (nonatomic, weak, nullable) id<LFLViewDelegate> delegate;
@property (nonatomic, weak, nullable) UIViewController *viewController;
@property (nonatomic, readonly, strong) UIScrollView *scrollView;
- (instancetype)initWithFrame:(CGRect) frame;
@end

NS_ASSUME_NONNULL_END
