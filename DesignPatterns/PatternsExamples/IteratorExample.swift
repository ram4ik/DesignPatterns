//
//  IteratorExample.swift
//  DesignPatterns
//
//  Created by ramil on 07.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import Foundation

class Driver {
    let isGoodDriver: Bool
    let name: String
    
    init(isGood: Bool, name: String) {
        self.isGoodDriver = isGood
        self.name = name
    }
}

class Car {
    var goodDriverIterator: GoodDriverIterator {
        return GoodDriverIterator(drivers: drivers)
    }
    
    private let drivers = [Driver(isGood: true, name: "Mark"),
                           Driver(isGood: false, name: "Ivan"),
                           Driver(isGood: true, name: "Maria"),
                           Driver(isGood: false, name: "Morgan")]
}

extension Car: Sequence {
    func makeIterator() -> GoodDriverIterator {
        return GoodDriverIterator(drivers: drivers)
    }
}

protocol BasicIterator: IteratorProtocol {
    init(drivers: [Driver])
    func allDrivers() -> [Driver]
}

class GoodDriverIterator: BasicIterator {
    private let drivers: [Driver]
    private var current = 0
    
    required init(drivers: [Driver]) {
        self.drivers = drivers.filter{ $0.isGoodDriver }
    }
    
    func next() -> Driver? {
        defer { current += 1 }
        return drivers.count > current ? drivers[current] : nil
    }
    
    func allDrivers() -> [Driver] {
        return drivers
    }
}

class IteratorExampleExecutor {
    func execute() {
        
        let car = Car()
        _ = car.goodDriverIterator.next()

        for driver in car {
            print(driver.name)
        }

        //let goodDriverIteratorViaSequence = car.makeIterator().allDrivers()


        //let array = [1, 2]
        //let iterator = array.makeIterator()
    }
}


