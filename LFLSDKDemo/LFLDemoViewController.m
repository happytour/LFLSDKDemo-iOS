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
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"分享"
                                                                                     message:@"模拟分享过程"
                                                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"分享成功" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [LFLSDKManager triggerCustomTask:LFLCustomTaskTypeShare success:YES];
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"分享失败" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [LFLSDKManager triggerCustomTask:LFLCustomTaskTypeShare success:NO];
        }];
        [alertController addAction:okAction];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    } else if (customTask == LFLCustomTaskTypeInvite) {
        //调用媒体端邀请逻辑
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"邀请"
                                                                                     message:@"模拟邀请过程"
                                                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"邀请成功" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [LFLSDKManager triggerCustomTask:LFLCustomTaskTypeInvite success:YES];
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"邀请失败" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [LFLSDKManager triggerCustomTask:LFLCustomTaskTypeInvite success:NO];
        }];
        [alertController addAction:okAction];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    } else if (customTask == LFLCustomTaskTypeTakePhoto) {
        //调用媒体端拍照逻辑
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"拍照"
                                                                                     message:@"模拟拍照过程"
                                                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"拍照成功" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [LFLSDKManager triggerCustomTask:LFLCustomTaskTypeTakePhoto success:YES];
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"拍照失败" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [LFLSDKManager triggerCustomTask:LFLCustomTaskTypeTakePhoto success:NO];
        }];
        [alertController addAction:okAction];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

@end
