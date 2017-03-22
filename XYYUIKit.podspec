

Pod::Spec.new do |s|

 

  s.name         = "XYYUIKit"
  s.version      = "1.0.1"
  s.summary      = "package userful tools catagory"

  s.description  = <<-DESC
                      package tools like UIButton Catagory 
                   DESC

  s.homepage     = "https://github.com/1273011249/XYYUIKit"


  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "xuyong" => "1273011249@qq.com" }

  s.platform     = :ios, '7.0'


  s.source       = { :git => "https://github.com/1273011249/XYYUIKit.git", :tag => "1.0.1" }


  s.source_files  = "Classes", "XYYUIKit/Classes/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  s.public_header_files = "XYYUIKit/Classes/*.h"

  s.requires_arc = true

end
