//
//  Locatable.swift
//  Locatable
//
//  Created by Vincent on 06/06/2019.
//  Copyright © 2019 Vincent. All rights reserved.
//

import Foundation

public struct Locator {
    static var factories: [ObjectIdentifier : () -> Any] = [:]
    
    public static func register<T>(_ type: T.Type = T.self, _ factory: @escaping () -> T) {
        self.factories[ObjectIdentifier(type)] = factory
    }
    
    public static func register<T>(_ type: T.Type, _ factory: @autoclosure @escaping () -> T) {
        self.factories[ObjectIdentifier(type)] = factory
    }
    
    public static func locate<T>(_ type: T.Type) -> T {
        return self.factories[ObjectIdentifier(type)]!() as! T
    }
}

@propertyWrapper
public struct Locatable<Service> {
    
    public init() { }
    
    public var value: Service {
        get {
            return Locator.locate(Service.self)
        }
    }
}
