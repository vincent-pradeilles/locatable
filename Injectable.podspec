Pod::Spec.new do |s|
  s.name             = 'Injectable'
  s.version          = '0.2.0'
  s.summary          = 'Injectable is a micro framework that leverages Property Wrappers to implement the Service Locator pattern, through a custom attribute @Injectable'

  s.description      = <<-DESC
Injectable is a Swift micro framework that leverages Property Wrappers to implement the Service Locator pattern, through a custom attribute `@Injectable`.

Here's an example of how it can be used:

protocol Servicing {
    func action()
}

class Service: Servicing {
    func action() {
        print("I'm performing a service 😊")
    }
}

Resolver.register(Servicing.self, { return Service() })

class MyController {
    @Injectable var service: Servicing
    
    func work() {
        self.service.action()
    }
}

let controller = MyController()

controller.work() // I'm performing a service 😊
                       DESC

  s.homepage         = 'https://github.com/vincent-pradeilles/injectable'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vincent Pradeilles' => 'vin.pradeilles+injectable@gmail.com' }
  s.source           = { :git => 'https://github.com/vincent-pradeilles/injectable.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.framework = 'Foundation'

  s.source_files = 'Injectable/**/*.swift'

end
