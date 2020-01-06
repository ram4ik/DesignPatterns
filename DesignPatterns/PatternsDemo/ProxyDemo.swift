//
//  ProxyDemo.swift
//  DesignPatterns
//
//  Created by ramil on 06.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import Foundation

class RandomIntWithID {
    var value: Int = {
        print("value initialized")
        return Int.random(in: Int.min...Int.max)
    }()
    
    lazy var uid: String = {
        print("uid initialized")
        return UUID().uuidString
    }()
}

class ProxyDemoExecutor {
    func execute() {
        let n = RandomIntWithID()
        print(n.uid)
    }
}
