Pod::Spec.new do |s|
  
  s.name         = "LRCalendar"
  s.version      = "0.0.5"
  s.summary      = "LRCalendar"
  s.description  = <<-DESC
		        			 可自定义日历
                   DESC

  s.homepage     = "https://github.com/Wmileo/LRCalendar"
  s.license      = "MIT"
  s.author       = { "leo" => "work.mileo@gmail.com" }

  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/Wmileo/LRCalendar.git", :tag => s.version.to_s }

  s.requires_arc = true

  s.source_files = 'LRCalendar/LRCalendar/*'

end
