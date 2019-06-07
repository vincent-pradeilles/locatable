# Injectable

![platforms](https://img.shields.io/badge/platforms-iOS-333333.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## Context

Injectable is a Swift micro framework that leverages Property Wrapper to implement the Service Locator pattern, through a custom attribute `@Injectable`.

Here's an example of how it can be used:

```swift
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
```

## Requirements

Xcode 11+ & Swift 5.1

## Installation

### Carthage

Add the following to your `Cartfile`:

`github "vincent-pradeilles/injectable"`
