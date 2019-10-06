//
//  Locatable.swift
//  Locatable
//
//  Created by Vincent on 06/06/2019.
//  Copyright © 2019 Vincent. All rights reserved.
//

import Foundation

public enum LocatingMode {
    case newInstance
    case sharedInstance
}

public struct Locator {
    static var factories: [ObjectIdentifier : () -> Any] = [:]
    
    static var sharedInstances: [ObjectIdentifier: Any] = [:]
    
    public static func register<T>(_ type: T.Type = T.self, _ factory: @escaping () -> T) {
        self.factories[ObjectIdentifier(type)] = factory
    }
    
    public static func register<T>(_ type: T.Type, _ factory: @autoclosure @escaping () -> T) {
        self.factories[ObjectIdentifier(type)] = factory
    }
    
    public static func locate<T>(_ type: T.Type, locatingMode: LocatingMode) -> T {
        let key = ObjectIdentifier(type)
        
        switch locatingMode {
        case .newInstance:
            return self.factories[key]!() as! T
        case .sharedInstance:
            guard let sharedInstance = self.sharedInstances[key] as? T else {
                let instance = self.factories[key]!() as! T
                
                self.sharedInstances[key] = instance
                
                return instance
            }
            
            return sharedInstance
        }
    }
}

@propertyWrapper
public struct Locatable<Service> {
    
    let locatingMode: LocatingMode
    
    public init(_ locatingMode: LocatingMode = .sharedInstance) {
        self.locatingMode = locatingMode
    }
    
    public var value: Service {
        get {
            return Locator.locate(Service.self, locatingMode: locatingMode)
        }
    }
}
