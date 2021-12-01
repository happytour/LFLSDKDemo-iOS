//
//  AppDelegate.m
//  LFLSDKDemo
//
//  Created by laole918 on 2021/8/12.
//

#import "AppDelegate.h"
#import <LFLSDK/LFLSDK.h>
#import "MainViewController.h"
#import "NSBundle+changeBundleId.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    NSString *fakeBundleId = [defaults objectForKey:@"fakeBundleId"];
    NSLog(@"fakeBundleId: %@", fakeBundleId);
    //模拟包名
    [[NSBundle mainBundle] changeBundleIdentifier:(fakeBundleId && fakeBundleId.length > 0) ? fakeBundleId : nil];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor grayColor];
    MainViewController *main = [[MainViewController alloc] init];
    UINavigationController *rootController = [[UINavigationController alloc] initWithRootViewController:main];
    
    self.window.rootViewController = rootController;
    [self.window makeKeyAndVisible];
    
    NSString *userId = [defaults objectForKey:@"userId"];
    NSString *appId = [defaults objectForKey:@"appId"];
    
    [LFLSDKManager setAppId:appId];
//    [LFLSDKManager initAppId:appId listener:^(BOOL success) {
//
//    }];
    [LFLSDKManager setUserId:userId];
    return YES;
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(nonnull NSUserActivity *)userActivity restorationHandler:(nonnull void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler {
    return [LFLSDKManager handleOpenUniversalLink:userActivity];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [LFLSDKManager applicationDidBecomeActive];
}

@end
