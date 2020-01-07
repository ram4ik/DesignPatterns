//
//  SimpleFactoryExample.swift
//  DesignPatterns
//
//  Created by ramil on 07.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import Foundation

enum CarType {
    case huge, fast
}

protocol SimpleFactoryCar {
    
    func drive()
}

class HugeCar: SimpleFactoryCar {
    
    func drive() {
        
        print("you drive huge car")
    }
}

class FastCar: SimpleFactoryCar {
    
    func drive() {
        
        print("you drive fast car")
    }
}

class SimpleFactoryCarFactory {
    
    static func produceCar(type: CarType) -> SimpleFactoryCar {
        var car: SimpleFactoryCar
        
        switch type {
        case .fast: car = FastCar()
        case .huge: car = HugeCar()
        }
        
        return car
    }
}

class SimpleFactoryExampleExecutor {
    func execute() {
        
        let hugeCar = HugeCar()
        hugeCar.drive()

        let fastCar = FastCar()
        fastCar.drive()
        
        let hugeCar1 = SimpleFactoryCarFactory.produceCar(type: .huge)
        let fastCar1 = SimpleFactoryCarFactory.produceCar(type: .fast)
        
        print(hugeCar1)
        print(fastCar1)
    }
}



