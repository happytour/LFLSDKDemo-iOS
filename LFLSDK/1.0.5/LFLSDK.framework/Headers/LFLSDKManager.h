//
//  LFLSDKManager.h
//  LFLSDK
//
//  Created by laole918 on 2021/8/17.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, LFLCustomTaskType) {
    LFLCustomTaskTypeTakePhoto = 5, // 拍照
    LFLCustomTaskTypeShare = 6, // 分享
    LFLCustomTaskTypeInvite = 7, // 邀请
};

typedef void (^LFLCustomTaskListener)(LFLCustomTaskType customTask);
typedef void (^LFLDismissListener)(void);

@interface LFLSDKManager : NSObject

+ (NSString *)sdkVersion;
+ (void)setAppId:(NSString *) appId;
+ (NSString *)getAppId;
+ (void)setUserId:(NSString *) userId;
+ (NSString *)getUserId;
+ (void)triggerCustomTask:(LFLCustomTaskType) customTask success:(BOOL) success;

+ (BOOL)handleOpenURL:(NSURL *)url;
+ (BOOL)handleOpenUniversalLink:(NSUserActivity *)userActivity;
+ (void)applicationDidBecomeActive;
+ (void)onWXApiDelegateReq:(id) req;
+ (void)onWXApiDelegateResp:(id) resp;

+ (void)showLFLFromRootViewController:(UIViewController *) viewController customTaskListener:(LFLCustomTaskListener __nullable)customTaskListener dismissListener:(LFLDismissListener __nullable)dismissListener;
@end

NS_ASSUME_NONNULL_END
