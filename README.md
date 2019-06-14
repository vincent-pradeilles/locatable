# Locatable

![platforms](https://img.shields.io/badge/platforms-iOS-333333.svg)
![pod](https://img.shields.io/cocoapods/v/Locatable.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## Context

Locatable is a Swift micro framework that leverages Property Wrappers to implement the Service Locator pattern, through a custom attribute `@Locatable`.

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

Locator.register(Servicing.self, { return Service() })

class MyController {
    @Locatable var service: Servicing
    
    func work() {
        self.service.action()
    }
}

let controller = MyController()

controller.work() // I'm performing a service 😊
```

For convenience, some shorthand syntax are also available:

```swift
// leverages @autoclosure
Locator.register(Servicing.self, Service())

// leverages default argument values
Locator.register { return Service() as Servicing }
```

## Requirements

Xcode 11+ & Swift 5.1

## Installation

### CocoaPods

Add the following to your `Podfile`:

`pod "Locatable"`

### Carthage

Add the following to your `Cartfile`:

`github "vincent-pradeilles/injectable"`
