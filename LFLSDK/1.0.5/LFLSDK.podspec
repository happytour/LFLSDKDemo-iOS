Pod::Spec.new do |s|
  s.name = "LFLSDK"
  s.version = "1.0.5"
  s.summary = "LFLSDK."
  s.authors = {"lyadsdk"=>"lyadsdk@lyadsdk.com"}
  s.homepage = "https://www.lyadsdk.com/"
  s.frameworks = ["Foundation", "UIKit", "MobileCoreServices", "CoreGraphics", "Security", "SystemConfiguration", "CoreTelephony", "AdSupport", "CoreData", "StoreKit", "WebKit", "Accelerate"]
  s.source = { :path => '.' }
  s.resource = 'LFLAssets.bundle'
  s.ios.deployment_target    = '9.0'
  s.ios.vendored_framework   = 'LFLSDK.framework'
end
