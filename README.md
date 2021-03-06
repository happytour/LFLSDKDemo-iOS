# 乐福乐iOS接入文档

## SDK项目部署

### 开发环境

- **开发工具**：推荐Xcode 12及以上版本

- **部署目标**：iOS 9.0及以上

- **SDK版本**：官网最新版本

### pod方式接入

```ruby
# Uncomment the next line to define a global platform for your project
# CocoaPods官方库
#source 'https://github.com/CocoaPods/Specs.git'
# 清华大学镜像库，如果上面库无法加载请使用下面镜像
source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
# 添加LYSpecs私库
source 'https://gitee.com/happytour/LYSpecs.git'
platform :ios, '9.0'

workspace 'LFLSDKDemo'
project 'LFLSDKDemo'

target 'LFLSDKDemo' do
  pod 'Ads-CN', '4.1.0.2' # 穿山甲官方
  pod 'GDTMobSDK', '4.13.26' # 广点通官方
  pod 'SigmobAd-iOS', '3.5.3' # sigmob官方
  pod 'BaiduMobAdSDK', '4.81' # 百度官方
  pod 'WechatOpenSDK', '1.8.7.1' # 微信官方
#  pod 'KSAdSDK', '3.3.22' # 快手AD官方（不能与KSAdSDKFull同时存在）
  # KSAdSDKFull、QySdk、JADYun、KlevinAdSDK，没有提交到官方库，需要引入LYSpecs私库拉取
  pod 'fork-KSAdSDKFull', '3.3.24.1' # 快手内容私库（不能与KSAdSDK同时存在）
  pod 'fork-QySdk', '1.3.2' # 爱奇艺私库
  pod 'fork-JADYun' , '1.3.4' # 京东私库
  pod 'fork-KlevinAdSDK', '2.4.1.222' # 游可赢私库

  pod 'LYAdSDK', '2.4.4'
  pod 'LYAdSDKAdapterForCSJ', '2.4.3' # 穿山甲支持
  pod 'LYAdSDKAdapterForGDT', '2.3.3' # 广点通支持
  pod 'LYAdSDKAdapterForKS', '2.4.1.1' # 快手AD支持
  pod 'LYAdSDKAdapterForKSContent', '2.4.1.1' # 快手内容支持
  pod 'LYAdSDKAdapterForSIG', '2.4.1' # sigmob支持
  pod 'LYAdSDKAdapterForIQY', '2.3.0' # 爱奇艺支持
  pod 'LYAdSDKAdapterForBD', '2.4.1' # 百度支持
  pod 'LYAdSDKAdapterForJD', '2.3.0' # 京东支持
  pod 'LYAdSDKAdapterForKLN', '2.4.1' # 游可赢支持

  pod 'LFLSDK', '1.1.1'
  pod 'LFLAssets***', '***' # ***联系相关人员获取
  project 'LFLSDKDemo'
end
```

### info.plist配置

#### http限制

在info.plist中添加 App Transport Security Settings 设定，由于苹果默认限制HTTP请求，需手动配置才可正常访问HTTP请求，SDK的API均已使用HTTPS但部分媒体资源需要使用HTTP TIPS：可以右击info.plist文件，选择Open As -> Source Code，然后将下列代码粘贴进去

```javascript
<key>NSAppTransportSecurity</key>
    <dict>
         <key>NSAllowsArbitraryLoads</key>
         <true/>
    </dict>
```

#### 关于 iOS 14 AppTrackingTransparency

在 iOS 14 设备上，建议您在应用启动时调用 apple 提供的 AppTrackingTransparency 方案，获取用户的 IDFA 授权，以便提供更精准的广告投放和收入优化

```javascript
<key>NSUserTrackingUsageDescription</key>
<string>需要获取您设备的广告标识符，以为您提供更好的广告体验</string>
```

权限请求窗口调用方法：`requestTrackingAuthorization(completionHandler:)`

## 接入代码

请向相关人员申请测试 appId

### 初始化

```objectivec
[LFLSDKManager initAppId:appId listener:^(BOOL success) {
    if (success) {
        // 初始化成功后才可以展示乐福乐
    }
}];
[LFLSDKManager setUserId:@"媒体用户唯一ID，可以是脱敏后的需保证唯一"];
```

### SDK版本号

```objectivec
// 例：1.0.0
NSLog(@"sdkVersion: %@", [LFLSDKManager sdkVersion]);
```

### 资源包版本号

```objectivec
// 例：100
NSLog(@"sdkAssetsVersion: %@", [LFLSDKManager sdkAssetsVersion]);
```

### 自定义任务

 其中customTask为媒体自定义任务，目前支持如下：

```objectivec
typedef NS_ENUM(NSInteger, LFLCustomTaskType) {
    LFLCustomTaskTypeTakePhoto = 5, // 拍照
    LFLCustomTaskTypeShare = 6, // 分享
    LFLCustomTaskTypeInvite = 7, // 邀请
    LFLCustomTaskTypeCheckLogin = 8, // 登录检测
    LFLCustomTaskTypeLogin = 9, // 登录
};
```

### 展示乐福乐

#### 通过showLFLFromRootViewController展示

```objectivec
[LFLSDKManager showLFLFromRootViewController:self customTaskListener:^(LFLView * lflView, LFLCustomTaskType customTask) {
    if (customTask == LFLCustomTaskTypeShare) {
        //调用媒体端分享逻辑
    } else if (customTask == LFLCustomTaskTypeInvite) {
        //调用媒体端邀请逻辑
    } else if (customTask == LFLCustomTaskTypeTakePhoto) {
        //调用媒体端拍照逻辑
    } else if (customTask == LFLCustomTaskTypeCheckLogin) {
        //调用媒体端检测登录逻辑
        if (...已登录...) {
            [LFLSDKManager triggerCustomTask:LFLCustomTaskTypeCheckLogin success:YES];
        } else {
            [LFLSDKManager triggerCustomTask:LFLCustomTaskTypeCheckLogin success:NO];
        }
    } else if (customTask == LFLCustomTaskTypeLogin) {
        //调用媒体端登录逻辑
    }
} dismissListener:^(LFLView * lflView) {
        //处理LFL关闭逻辑
}];
```

#### 通过LFLView展示

```objectivec
// LFLView代理
@protocol LFLViewDelegate <NSObject>
@optional
//关闭回调
- (void)lfl_lflViewDidClose:(LFLView *) lflView;
//调用自定义任务回调
- (void)lfl_lflViewDidCallCustomTask:(LFLView *) lflView customTask:(LFLCustomTaskType) customTask;
@end
```

```objectivec
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
    //加载LFLView
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
    } else if (customTask == LFLCustomTaskTypeInvite) {
        //调用媒体端邀请逻辑
    } else if (customTask == LFLCustomTaskTypeTakePhoto) {
        //调用媒体端拍照逻辑
    } else if (customTask == LFLCustomTaskTypeCheckLogin) {
        //调用媒体端检测登录逻辑
        if (...已登录...) {
            [LFLSDKManager triggerCustomTask:LFLCustomTaskTypeCheckLogin success:YES];
        } else {
            [LFLSDKManager triggerCustomTask:LFLCustomTaskTypeCheckLogin success:NO];
        }
    } else if (customTask == LFLCustomTaskTypeLogin) {
        //调用媒体端登录逻辑
    }
}
```

### 生命周期回调

**注：如果不含有微信支付模块可以不用接入，如果需要接入下面两个方案任选其一**

#### 由SDK内部处理微信相关接口（建议使用）

##### 普通模式

```objectivec
- (BOOL)application:(UIApplication *)application continueUserActivity:(nonnull NSUserActivity *)userActivity restorationHandler:(nonnull void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler {
    return [LFLSDKManager handleOpenUniversalLink:userActivity];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [LFLSDKManager applicationDidBecomeActive];
}
```

##### SceneDelegate模式

```objectivec
- (void)scene:(UIScene *)scene continueUserActivity:(NSUserActivity *)userActivity {
    [LFLSDKManager handleOpenUniversalLink:userActivity];
}

- (void)sceneDidBecomeActive:(UIScene *)scene {
    [LFLSDKManager applicationDidBecomeActive];
}
```

#### 由媒体自已处理微信相关接口

##### 普通模式

```objectivec
- (BOOL)application:(UIApplication *)application continueUserActivity:(nonnull NSUserActivity *)userActivity restorationHandler:(nonnull void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler {
    //此处由媒体自己处理
    return [WXApi handleOpenUniversalLink:userActivity delegate:self];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [LFLSDKManager applicationDidBecomeActive];
}

#pragma mark -- WXApiDelegate

- (void)onReq:(BaseReq*)req {
    //需要在媒体的微信回调中调用SDK的对应处理
    [LFLSDKManager onWXApiDelegateReq:req];
}

- (void)onResp:(BaseResp*)resp {
    ////需要在媒体的微信回调中调用SDK的对应处理
    [LFLSDKManager onWXApiDelegateResp:resp];
}
```

##### SceneDelegate模式

参考“由SDK内部处理微信相关接口”及“由媒体自已处理微信相关接口”的普通模式，实现
