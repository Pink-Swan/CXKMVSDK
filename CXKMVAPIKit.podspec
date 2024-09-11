Pod::Spec.new do |s|
  s.name             = 'CXKMVAPIKit'
  s.version          = '0.0.1'
  s.summary          = 'Overseas Movie & TV Network Request SDK'
  s.description      = <<-DESC
The Overseas Movie & TV Network Request SDK provides an easy-to-use network request solution designed for accessing movie and TV content from overseas servers. This SDK is optimized for speed, efficiency, and secure data transmission.
                       DESC
  s.homepage         = 'https://github.com/Pink-Swan/CXKMVSDK'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Pink' => 'pink@gamil.com' }
  s.source           = { :git => 'https://github.com/Pink-Swan/CXKMVSDK.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.static_framework = true

  s.ios.vendored_frameworks = 'CXKMVAPIKit.xcframework'
  s.dependency 'ZipArchive'
  
end
