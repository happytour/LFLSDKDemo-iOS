//
//  LFLDemoViewController.m
//  LFLSDKDemo
//
//  Created by laole918 on 2021/10/28.
//

#import "LFLDemoViewController.h"
#import <LFLSDk/LFLSDK.h>

@interface LFLDemoViewController () <LFLViewDelegate>

@end

@implementation LFLDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect bounds = self.view.bounds;
    if (bounds.size.width > bounds.size.height) {
        CGFloat h = bounds.size.width;
        bounds.size.width = bounds.size.height;
        bounds.size.height = h;
    }
    LFLView * lflView = [[LFLView alloc] initWithFrame:CGRectMake(0, 0, bounds.size.width, bounds.size.height)];
    if (self.modalPresentationStyle == UIModalPresentationFullScreen) {
        if (@available(iOS 11.0, *)) {
            lflView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    lflView.viewController = self;
    lflView.delegate = self;
    [self.view addSubview:lflView];
}

//是否旋转
-(BOOL)shouldAutorotate {
    return NO;
}
//支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
//viewController初始显示的方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (void)lfl_lflViewDidClose:(LFLView *) lflView {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)lfl_lflViewDidCallCustomTask:(LFLView *) lflView customTask:(LFLCustomTaskType) customTask {
    if (customTask == LFLCustomTaskTypeShare) {
        //调用媒体端分享逻辑
//        if (分享成功) {
            [LFLSDKManager triggerCustomTask:LFLCustomTaskTypeShare success:YES];
//        } else {
//            [LFLSDKManager triggerCustomTask:LFLCustomTaskTypeShare success:NO];
//        }
    }
}

@end
