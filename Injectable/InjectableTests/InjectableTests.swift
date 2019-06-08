//
//  InjectableTests.swift
//  InjectableTests
//
//  Created by Vincent on 08/06/2019.
//  Copyright © 2019 Vincent. All rights reserved.
//

import XCTest
@testable import Injectable

protocol Servicing {
    func action()
}

class Service: Servicing {
    func action() {
        print("I'm performing a service 😊")
    }
}

class MyController {
    @Injectable var service: Servicing
    
    func work() {
        self.service.action()
    }
}

class InjectableTests: XCTestCase {
    
    override func setUp() {
        Resolver.factories.removeAll()
    }

    func testRegistering() {
        Resolver.register(Servicing.self, { return Service() })
        
        let controller = MyController()
        
        controller.work()
    }
    
    func testRegisteringWithTypeInference() {
        Resolver.register { return Service() as Servicing }
        
        let controller = MyController()
        
        controller.work()
    }
    
    func testRegisteringWithAutoClosure() {
        Resolver.register(Servicing.self, Service())
        
        let controller = MyController()
        
        controller.work()
    }
}
