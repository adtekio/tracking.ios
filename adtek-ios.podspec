#
# Be sure to run `pod lib lint adtek-ios.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'adtek-ios'
  s.version          = '0.1.0'
  s.summary          = 'A short description of adtek-ios.'
  s.module_name      = 'Adtek'
#  s.module_map       = 'adtek-ios/module.modulemap'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/<GITHUB_USERNAME>/adtek-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Nicky Weber' => 'nicky.weber@adtek.io' }
  s.source           = { :git => 'https://github.com/<GITHUB_USERNAME>/adtek-ios.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'adtek-ios/Classes/**/*'
end
