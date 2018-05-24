#
# Be sure to run `pod lib lint ParkingSignView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ParkingSignView'
  s.version          = '0.1.0'
  s.summary          = 'A flexible parking sing view designed to match Victoria street parking signs.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
"ParkingSingView is an iOS swift library which return street parking sign view for Melbourne style. It is extremely flexible and easy to implement."
                       DESC

  s.homepage         = 'https://github.com/KPR7168/ParkingSignView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'KPR7168' => 'pich_ratanak@ymail.com' }
  s.source           = { :git => 'https://github.com/KPR7168/ParkingSignView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ParkingSignView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ParkingSignView' => ['ParkingSignView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
