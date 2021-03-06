
Pod::Spec.new do |spec|

  

  spec.name         = "HKStepper"
  spec.version      = "1.0.4"
  spec.license      = "MIT"
  spec.summary      = "Custom stepper controls to select time or numbers."

  
  spec.description  = <<-DESC
  HKStepper offers two controls, HKTimeStepper to select time and HKValueStepper to select integer values. Both controls are customizable.
                   DESC

  spec.homepage     = "https://github.com/HasanKassem/HKStepper"
  spec.social_media_url = 'https://twitter.com/hasankassem_'







  spec.author    = "Hasan Kassem"
  

  spec.platform     = :ios, "12.0"

 

  spec.source       = { :git => "https://github.com/HasanKassem/HKStepper.git", :tag => "1.0.4" }


 
  spec.source_files     =   'HKStepper/Sources/**/*.swift'
  spec.resource_bundles = {
   'HKStepper' => [
       'HKStepper/Assets/*.xib',"HKStepper/Assets/*.png"
   ]
   }

  spec.swift_version = "5"
  

end
