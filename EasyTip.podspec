#
# Be sure to run `pod lib lint EasyTip.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EasyTip'
  s.version          = '1.0.3'
  s.summary          = 'A Easy Tip View.'

  s.description      = <<-DESC
EasyTip is a tip view for developer.
                       DESC

  s.homepage         = 'https://github.com/NingLi-iOSer/EasyTip'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'NingLi-iOSer' => 'lining201702@gmail.com' }
  s.source           = { :git => 'https://github.com/NingLi-iOSer/EasyTip.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.swift_version = '5.0'

  s.source_files = 'EasyTip/Classes/**/*'

  s.frameworks = 'UIKit', 'Foundation'
end
