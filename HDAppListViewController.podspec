Pod::Spec.new do |s|
s.name = 'HDAppListViewController'
s.version = '1.0.3'
s.license= { :type => "MIT", :file => "LICENSE" }
s.summary = 'HDAppListViewController，可以快速设置app的列表，点击即可跳转到appstore的下载页面'
s.homepage = 'https://github.com/DamonHu/HDAppListViewController'
s.authors = { 'DamonHu' => 'dong765@qq.com' }
s.source = { :git => "https://github.com/DamonHu/HDAppListViewController.git", :tag => s.version}
s.requires_arc = true
s.ios.deployment_target = '9.0'
s.source_files = "HDAppListViewController/HDAppListViewController/LCBannerView/*.{h,m}","HDAppListViewController/HDAppListViewController/*.{h,m}"
s.frameworks = 'UIKit','Foundation'
end