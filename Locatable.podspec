Pod::Spec.new do |s|
  s.name             = 'Locatable'
  s.version          = '0.4'
  s.summary          = 'Locatable is a micro framework that leverages Property Wrappers to implement the Service Locator pattern, through a custom attribute @Locatable'

  s.description      = <<-DESC
Locatable is a Swift micro framework that leverages Property Wrappers to implement the Service Locator pattern, through a custom attribute `@Locatable`.

Here's an example of how it can be used:

protocol Servicing {
    func action()
}

class Service: Servicing {
    func action() {
        print("I'm performing a service 😊")
    }
}

Locator.register(Servicing.self, { return Service() })

class MyController {
    @Locatable var service: Servicing
    
    func work() {
        self.service.action()
    }
}

let controller = MyController()

controller.work() // I'm performing a service 😊
                       DESC

  s.homepage         = 'https://github.com/vincent-pradeilles/locatable'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vincent Pradeilles' => 'vin.pradeilles+locatable@gmail.com' }
  s.source           = { :git => 'https://github.com/vincent-pradeilles/locatable.git', :tag => s.version.to_s }

  s.swift_version = '5.1'
  s.ios.deployment_target = '9.0'

  s.framework = 'Foundation'

  s.source_files = 'Locatable/Locatable/**/*.swift'

end
