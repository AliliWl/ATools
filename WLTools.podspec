Pod::Spec.new do |s|
  s.name             = "WLTools"
  s.version          = "0.1.0"
  s.summary          = "String Tool"  
  s.description      = <<-DESC
			a string tool with check string
                       DESC

  s.homepage         = "https://github.com/AliliWl"
  s.license          = 'MIT'
  s.author           = { "wangli" => "Aliliios@163.com" }
  s.source           = { :git => "https://github.com/AliliWl/WLTools.git", :tag => "0.1.0" }
  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'WLTools' => ['Pod/Assets/*.png']
  }
end
