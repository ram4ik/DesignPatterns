//
//  AbstractFactoryExample.swift
//  DesignPatterns
//
//  Created by ramil on 07.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import Foundation

protocol AbstractFactoryCar {
    
    func drive()
}

class LittleSizeCar: AbstractFactoryCar {
    
    func drive() {
        print("drive a little car")
    }
}

class MiddleSizeCar: AbstractFactoryCar {
    
    func drive() {
        print("drive a middle car")
    }
}

protocol Bus {
    
    func drive()
}

class LittleSizeBus: Bus {
    
    func drive() {
        print("drive a little bus")
    }
}

class MiddleSizeBus: Bus {
    
    func drive() {
        print("drive a middle size bus")
    }
}


protocol Factory {
    
    func produceBus() -> Bus
    func produceCar() -> AbstractFactoryCar
}

class LittleSizeFactory: Factory {
        
    @discardableResult
    func produceBus() -> Bus {
        print("Little bus is created")
        return LittleSizeBus()
    }
    
    @discardableResult
    func produceCar() -> AbstractFactoryCar {
        print("Little size car is creates")
        return LittleSizeCar()
    }
}

class MiddleSizeFactory: Factory {
        
    @discardableResult
    func produceBus() -> Bus {
        print("Middle bus is created")
        return MiddleSizeBus()
    }
    
    @discardableResult
    func produceCar() -> AbstractFactoryCar {
        print("Middle size car is creates")
        return MiddleSizeCar()
    }
}


class AbstractFactoryExampleExecutor {
    func execute() {
        
        let littleFactory = LittleSizeFactory()
        littleFactory.produceCar()


        let middleFactory = MiddleSizeFactory()
        middleFactory.produceBus()
    }
}


