
Pod::Spec.new do |s|
  s.name         = "RNMarketingCloud"
  s.version      = "1.0.0"
  s.summary      = "RNMarketingCloud"
  s.description  = <<-DESC
                  RNMarketingCloud
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RNMarketingCloud.git", :tag => "master" }
  s.source_files  = "RNMarketingCloud/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  