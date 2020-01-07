//
//  AdapterExample.swift
//  DesignPatterns
//
//  Created by ramil on 07.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import Foundation

// adaptee
class SimpleCar {
    
    func sound() -> String {
        return "tr-tr-tr-tr"
    }
}

// target
protocol SupercarProtocol {
    
    func makeNoise() -> String
}

class Supercar: SupercarProtocol {
    
    func makeNoise() -> String {
        return "wroom-wroom"
    }
}

// adaptor
class SupercarAdaptor: SupercarProtocol {
    
    var simpleCar: SimpleCar
    
    init(simpleCar: SimpleCar) {
        self.simpleCar = simpleCar
    }
    
    func makeNoise() -> String {
        return simpleCar.sound()
    }
}
var simpleCar = SimpleCar()

class AdapterExampleExecutor {
    func execute() {
        let superCarAdapter = SupercarAdaptor(simpleCar: simpleCar)
        superCarAdapter.makeNoise()
    }
}
