//
//  Injectable.swift
//  Injectable
//
//  Created by Vincent on 06/06/2019.
//  Copyright © 2019 Vincent. All rights reserved.
//

import Foundation

struct Resolver {
    static private var factories: [ObjectIdentifier : () -> Any] = [:]
    
    static func register<T>(_ type: T.Type, _ factory: @escaping () -> T) {
        self.factories[ObjectIdentifier(type)] = factory
    }
    static func resolve<T>(_ type: T.Type) -> T {
        return self.factories[ObjectIdentifier(type)]!() as! T
    }
}

@propertyWrapper
struct Injectable<Service> {
    var value: Service {
        get {
            return Resolver.resolve(Service.self)
        }
    }
}
