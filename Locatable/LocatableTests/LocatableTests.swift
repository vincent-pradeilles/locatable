//
//  LocatableTests.swift
//  LocatableTests
//
//  Created by Vincent on 14/06/2019.
//  Copyright © 2019 Vincent. All rights reserved.
//

import XCTest
@testable import Locatable

fileprivate protocol Servicing: AnyObject {
    func action()
}

fileprivate class Service: Servicing {
    func action() {
        print("I'm performing a service 😊")
    }
}

class LocatableTests: XCTestCase {

    override func setUp() {
        Locator.factories.removeAll()
    }

    func testServiceLocating() {
        Locator.register(Servicing.self, { return Service() })

        let service = Locator.locate(Servicing.self)
        
        XCTAssert(service is Service)
    }
    
    func testScopedInstance() {
        Locator.register(Servicing.self, { () -> () -> Service in
            let singleton = Service()
            
            return { return singleton }
        }())
        
        let first = Locator.locate(Servicing.self)
        let second = Locator.locate(Servicing.self)
        
        XCTAssert(first === second)
    }
}
