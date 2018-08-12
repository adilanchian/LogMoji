#
# Be sure to run `pod lib lint LogMoji.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LogMoji'
  s.version          = '1.0.0'
  s.summary          = 'Associate your log statements with meaningful emojis to better your debugging experience.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  'LogMoji is here to help you parse through all your verbose log statements with meaningful emojis that stand out! This simple logger has the ability to log to your console, a specified file path, or both! It also has the ability for you to set as many customs states as you would like. Make your log statements easier to read with LogMoji.'
                       DESC

  s.homepage         = 'https://github.com/adilanchian/LogMoji'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Alec Dilanchian' => 'alec.d@pixelogicapps.com' }
  s.source           = { :git => 'https://github.com/adilanchian/LogMoji.git', :branch => "master", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/alec_dilanchian'

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.0'
  s.source_files = 'LogMoji/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LogMoji' => ['LogMoji/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
