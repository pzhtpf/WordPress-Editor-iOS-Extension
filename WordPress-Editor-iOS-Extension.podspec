#
# Be sure to run `pod lib lint WordPress-Editor-iOS-Extension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = "WordPress-Editor-iOS-Extension"
s.version          = "0.1.4"
s.summary      = "Reusable component rich text editor for WordPress.com in an iOS application."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description  = "Reusable component rich text editor for WordPress.com in an iOS application.And can allow users to customize the editor toolbar."


s.homepage         = "https://github.com/pzhtpf/WordPress-Editor-iOS-Extension"
# s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
s.license          = 'MIT'
s.author           = { "tianpengfei" => "389744841@qq.com" }
s.source           = { :git => "https://github.com/pzhtpf/WordPress-Editor-iOS-Extension.git", :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

s.ios.deployment_target = '8.0'
s.requires_arc = true

s.source_files = 'WordPress-Editor-iOS-Extension/Classes/**/*'

s.resources = ["WordPress-Editor-iOS-Extension/Assets/*.png", "WordPress-Editor-iOS-Extension/Assets/*.html", "WordPress-Editor-iOS-Extension/Assets/*.js", "WordPress-Editor-iOS-Extension/Assets/*.svg", "WordPress-Editor-iOS-Extension/Assets/*.css", "WordPress-Editor-iOS-Extension/Assets/*.storyboard", "WordPress-Editor-iOS-Extension/Assets/*.xib"]

s.prefix_header_file = "WordPress-Editor-iOS-Extension/Classes/WordPress-Editor-iOS-Extension.pch"

s.resource_bundles = {
'WordPress-Editor-iOS-Extension' => ['WordPress-Editor-iOS-Extension/Assets/*.png']
}

# s.public_header_files = 'Pod/Classes/**/*.h'
#  s.frameworks = 'UIKit', 'Foundation'
s.dependency 'WordPress-iOS-Shared'
s.dependency 'WordPressCom-Analytics-iOS'
s.dependency 'NSObject-SafeExpectations'
s.dependency 'WYPopoverController'
s.dependency 'UIAlertView+Blocks'

end
