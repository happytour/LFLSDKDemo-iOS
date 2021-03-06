//
//  MainViewController.m
//  LYAdSDKDemo
//
//  Created by laole918 on 2021/4/27.
//

#import "MainViewController.h"
#import "ConfigViewController.h"
#import <LFLSDK/LFLSDK.h>
#import "NSBundle+changeBundleId.h"
#import "LFLDemoViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:@"LFLSDKDemo"];
    
    UIScrollView *layout = [[UIScrollView alloc] init];
    layout.frame = self.view.bounds;
    [self.view addSubview:layout];
    CGFloat y = -50;
    {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button.layer setCornerRadius:10.0];
        button.backgroundColor = [UIColor whiteColor];
        button.frame = CGRectMake(10, y += 60, self.view.bounds.size.width - 20, 50);
        [button setTitle:NSLocalizedString(@"Config", nil) forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateFocused];
        [button addTarget:self action:@selector(clickBtnConfig) forControlEvents:UIControlEventTouchUpInside];
        [layout addSubview:button];
    }
    {
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        NSString *appVersionCode = [infoDictionary objectForKey:@"CFBundleVersion"];
        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
        NSString *userId = [defaults objectForKey:@"userId"];
        NSString *appId = [defaults objectForKey:@"appId"];
//        NSString *fakeBundleId = [defaults objectForKey:@"fakeBundleId"];
        NSString *fakeBundleId = [NSBundle mainBundle].nowBundleId ? [NSBundle mainBundle].nowBundleId : [NSBundle mainBundle].orgBundleId;
        NSString * log = [NSString stringWithFormat:@"demo version: %@(%@)\nsdk version: %@(%d)\nsdk assets version: %@\nappId: %@\nuserId: %@\n%@: %@", appVersion, appVersionCode, [LFLSDKManager sdkVersion], (int)LFLSDKVersionNumber, [LFLSDKManager sdkAssetsVersion], appId, userId, NSLocalizedString(@"fakeBundleId", nil), fakeBundleId];
        UITextView *logText = [[UITextView alloc] init];
        logText.textColor = UIColor.whiteColor;
        logText.backgroundColor = UIColor.blackColor;
        logText.text = log;
        logText.editable = NO;
        logText.layoutManager.allowsNonContiguousLayout = NO;
        [logText sizeToFit];
        logText.frame = CGRectMake(10, y += 60, self.view.bounds.size.width - 20, logText.bounds.size.height);
        [layout addSubview:logText];
        y += logText.bounds.size.height - 50;
    }
    {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button.layer setCornerRadius:10.0];
        button.backgroundColor = [UIColor whiteColor];
        button.frame = CGRectMake(10, y += 60, self.view.bounds.size.width - 20, 50);
        [button setTitle:NSLocalizedString(@"LFL1", nil) forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateFocused];
        [button addTarget:self action:@selector(clickBtnLFL1) forControlEvents:UIControlEventTouchUpInside];
        [layout addSubview:button];
    }
    {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button.layer setCornerRadius:10.0];
        button.backgroundColor = [UIColor whiteColor];
        button.frame = CGRectMake(10, y += 60, self.view.bounds.size.width - 20, 50);
        [button setTitle:NSLocalizedString(@"LFL2", nil) forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateFocused];
        [button addTarget:self action:@selector(clickBtnLFL2) forControlEvents:UIControlEventTouchUpInside];
        [layout addSubview:button];
    }
    {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button.layer setCornerRadius:10.0];
        button.backgroundColor = [UIColor whiteColor];
        button.frame = CGRectMake(10, y += 60, self.view.bounds.size.width - 20, 50);
        [button setTitle:NSLocalizedString(@"LFL3", nil) forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateFocused];
        [button addTarget:self action:@selector(clickBtnLFL3) forControlEvents:UIControlEventTouchUpInside];
        [layout addSubview:button];
    }
    layout.contentSize = CGSizeMake(0, y + 60);
}

- (void)clickBtnConfig {
    ConfigViewController *vc = [[ConfigViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)clickBtnLFL1 {
    if (![self checkAppIdAndUserId]) {
        return;
    }
    LFLDemoViewController *lflVc = [[LFLDemoViewController alloc] init];
    [self.navigationController pushViewController:lflVc animated:YES];
}

- (void)clickBtnLFL2 {
    if (![self checkAppIdAndUserId]) {
        return;
    }
    LFLDemoViewController *lflVc = [[LFLDemoViewController alloc] init];
    lflVc.modalPresentationStyle = UIModalPresentationFullScreen;
    [lflVc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:lflVc animated:YES completion:nil];
}

- (BOOL)checkAppIdAndUserId {
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    NSString *userId = [defaults objectForKey:@"userId"];
    NSString *appId = [defaults objectForKey:@"appId"];
    if (!userId || userId.length == 0 || !appId || appId.length == 0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error"
                                                                                     message:@"appId??????userId????????????"
                                                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"?????????" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
        return NO;
    }
    return YES;
}

- (void)clickBtnLFL3 {
    if (![self checkAppIdAndUserId]) {
        return;
    }
    [LFLSDKManager showLFLFromRootViewController:self customTaskListener:^(LFLView * lflView, LFLCustomTaskType customTask) {
        if (customTask == LFLCustomTaskTypeShare) {
            //???????????????????????????
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"??????"
                                                                                         message:@"??????????????????"
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"????????????" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [LFLSDKManager triggerCustomTask:LFLCustomTaskTypeShare success:YES];
            }];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"????????????" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                [LFLSDKManager triggerCustomTask:LFLCustomTaskTypeShare success:NO];
            }];
            [alertController addAction:okAction];
            [alertController addAction:cancelAction];
            [lflView.viewController presentViewController:alertController animated:YES completion:nil];
        } else if (customTask == LFLCustomTaskTypeInvite) {
            //???????????????????????????
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"??????"
                                                                                         message:@"??????????????????"
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"????????????" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [LFLSDKManager triggerCustomTask:LFLCustomTaskTypeInvite success:YES];
            }];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"????????????" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                [LFLSDKManager triggerCustomTask:LFLCustomTaskTypeInvite success:NO];
            }];
            [alertController addAction:okAction];
            [alertController addAction:cancelAction];
            [lflView.viewController presentViewController:alertController animated:YES completion:nil];
        } else if (customTask == LFLCustomTaskTypeTakePhoto) {
            //???????????????????????????
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"??????"
                                                                                         message:@"??????????????????"
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"????????????" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [LFLSDKManager triggerCustomTask:LFLCustomTaskTypeTakePhoto success:YES];
            }];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"????????????" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                [LFLSDKManager triggerCustomTask:LFLCustomTaskTypeTakePhoto success:NO];
            }];
            [alertController addAction:okAction];
            [alertController addAction:cancelAction];
            [lflView.viewController presentViewController:alertController animated:YES completion:nil];
        } else if (customTask == LFLCustomTaskTypeCheckLogin) {
            //?????????????????????????????????
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"????????????"
                                                                                         message:@"????????????????????????"
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"?????????" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [LFLSDKManager triggerCustomTask:LFLCustomTaskTypeCheckLogin success:YES];
            }];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"?????????" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                [LFLSDKManager triggerCustomTask:LFLCustomTaskTypeCheckLogin success:NO];
            }];
            [alertController addAction:okAction];
            [alertController addAction:cancelAction];
            [lflView.viewController presentViewController:alertController animated:YES completion:nil];
        } else if (customTask == LFLCustomTaskTypeLogin) {
            //???????????????????????????
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"??????"
                                                                                         message:@"??????????????????"
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"????????????" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [LFLSDKManager triggerCustomTask:LFLCustomTaskTypeLogin success:YES];
            }];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"????????????" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                [LFLSDKManager triggerCustomTask:LFLCustomTaskTypeLogin success:NO];
            }];
            [alertController addAction:okAction];
            [alertController addAction:cancelAction];
            [lflView.viewController presentViewController:alertController animated:YES completion:nil];
        }
    } dismissListener:^(LFLView * lflView) {
        //??????LFL????????????
    }];
}

@end
