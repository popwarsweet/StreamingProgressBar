#
# Be sure to run `pod lib lint StreamingProgressBar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'StreamingProgressBar'
  s.version          = '1.0.0'
  s.summary          = 'A progress bar w/ a secondary bar, can be used for showing both play and buffer progress in the same view.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A progress bar w/ a secondary bar, can be used for showing both play and buffer progress in the same view. The view is fully customizable w/in Interface Builder.
                       DESC

  s.homepage         = 'https://github.com/popwarsweet/StreamingProgressBar'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Kyle Zaragoza' => 'popwarsweet@gmail.com' }
  s.source           = { :git => 'https://github.com/popwarsweet/StreamingProgressBar.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/KyleZaragoza'

  s.ios.deployment_target = '8.0'

  s.source_files = 'StreamingProgressBar/Classes/**/*'
end
