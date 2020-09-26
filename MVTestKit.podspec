Pod::Spec.new do |s|
    s.name         = "MVTestKit"
    s.version      = "0.0.0"
    s.summary      = "A Helper Framework for Swift Testing"
    s.description  = <<-DESC
                     Use TestKit to write tests more simply with Premade helpers.
                     DESC
    s.homepage     = "https://github.com/MathVasc/TestKit"
    s.author       = "Matheus de Vasconcelos"
    s.ios.deployment_target = "11.0"
    s.source       = { :git => "https://github.com/MathVasc/TestKit.git",
                       :tag => "#{s.version}" }
  
    s.source_files = [
      "Sources/**/**.swift"
    ]
  
    s.weak_framework = "XCTest"
    s.requires_arc = true
    s.pod_target_xcconfig = {
      'APPLICATION_EXTENSION_API_ONLY' => 'YES',
      'DEFINES_MODULE' => 'YES',
      'ENABLE_BITCODE' => 'NO',
      'ENABLE_TESTING_SEARCH_PATHS' => 'YES',
      'OTHER_LDFLAGS' => '$(inherited) -weak-lswiftXCTest -Xlinker -no_application_extension',
      'OTHER_SWIFT_FLAGS' => '$(inherited) -suppress-warnings',
    }
  
    s.cocoapods_version = '>= 1.4.0'
    if s.respond_to?(:swift_versions) then
      s.swift_versions = ['5.0']
    else
      s.swift_version = '5.0'
    end
  end
