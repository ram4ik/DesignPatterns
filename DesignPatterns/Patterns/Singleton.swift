//
//  Singleton.swift
//  DesignPatterns
//
//  Created by Ramill Ibragimov on 31.12.2019.
//  Copyright © 2019 Ramill Ibragimov. All rights reserved.
//

import Foundation

final class Singleton {
    
    static let shared = Singleton()
    
    private init() {
        
    }
    
    var value: Int = 0
    
    func doSomething() {
        print("Doing something with value \(value)")
    }
}

class SingletonExecutor {
    
    func execute() {
        
        let object = Singleton.shared
        object.value = 1000

        let secondObject = Singleton.shared
        secondObject.value = 2000

        object.doSomething()
        secondObject.doSomething()

        print("object === secondObject => \(object === secondObject)")
    }
}
