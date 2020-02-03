Pod::Spec.new do |spec|
  spec.name         = "CartFramework"
  spec.version      = "1.0.0"
  spec.summary      = "This CartFramework can be used for any shopping product"
  spec.homepage     = "https://github.com/WaqarAhmedBajwa/CartFramework"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  spec.license      = "MIT"
  spec.author       = { "WaqarAhmedBajwa" => "waqarahmed.bajwa@gmail.com" }
  spec.source       = { :git => "https://github.com/WaqarAhmedBajwa/CartFramework.git", :tag => "1.0.0" }
  spec.source_files  = "CartFramework/**/*"
  spec.exclude_files = "CartFrameWork/info.plist"
end
