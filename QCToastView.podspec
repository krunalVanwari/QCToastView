Pod::Spec.new do |s|
  s.name             = 'QCToastView'
  s.version          = '1.0'
  s.summary          = 'Show custom toast view'
  s.homepage         = 'https://github.com/krunalVanwari/QCToastView'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Qurious Click' => 'https://www.quriousclick.com' }
  s.source           = { :git => 'https://github.com/krunalVanwari/QCToastView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/QCToastView/**/*'
end
