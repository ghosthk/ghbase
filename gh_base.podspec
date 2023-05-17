Pod::Spec.new do |s|

    s.name             = 'gh_base'
    s.version          = '0.0.1'
    s.summary          = '基础库'

    s.homepage         = 'https://gitee.com/tapque/gh-base.git'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'gehui.liu' => 'gehui.liu@buttontech.com' }
    s.source           = { :git => 'https://gitee.com/tapque/gh-base.git', :tag => s.version.to_s }

    s.ios.deployment_target = '11.0'
    s.static_framework = true

    s.source_files = 'Category/*.swift', 'Base/*.swift', 'Toast/*.swift'

    s.dependency 'SVProgressHUD'
    s.dependency 'JDStatusBarNotification'
    s.dependency 'SwifterSwift'
    s.dependency 'SnapKit'
    s.dependency 'EachNavigationBar'
    s.dependency 'Then'

end
