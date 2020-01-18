//
//  FactoryMethodExample.swift
//  DesignPatterns
//
//  Created by ramil on 07.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import Foundation

protocol Vehicle {
    
    func drive()
}

class FactoryMethodCar: Vehicle {
    
    func drive() {
        print("drive a car")
    }
}

class Truck: Vehicle {
    
    func drive() {
        print("drive a truck")
    }
}

class FactoryMethodBus: Vehicle {
    
    func drive() {
        print("drive a bus")
    }
}


protocol VehicleFactory {
    
    func produce() -> Vehicle
}

class CarFactory: VehicleFactory {
    
    @discardableResult
    func produce() -> Vehicle {
        print("car is created")
        return FactoryMethodCar()
    }
}

class TruckFactory: VehicleFactory {
            
    @discardableResult
    func produce() -> Vehicle {
        print("truck is created")
        return Truck()
    }
}

class  BusFactory: VehicleFactory {
    
    @discardableResult
    func produce() -> Vehicle {
        print("bus is created")
        return FactoryMethodBus()
    }
}

class FactoryMethodExampleExecutor {
    func execute() {
        
        let carFacory = CarFactory()
        _ = carFacory.produce()

        let truckFactory = TruckFactory()
        _ = truckFactory.produce()

        let busFactory = BusFactory()
        _ = busFactory.produce()
    }
}

