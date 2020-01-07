//
//  CompositeExample.swift
//  DesignPatterns
//
//  Created by ramil on 07.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import Foundation

protocol Coworker {
    func hire(coworker: Coworker)
    func getInfo()
    var lvl: Int { get }
}

// branch
class Manager: Coworker {
    private var coworkers = [Coworker]()
    var lvl: Int
    
    init(lvl: Int) {
        self.lvl = lvl
    }
    
    func hire(coworker: Coworker) {
        self.coworkers.append(coworker)
    }
    
    func getInfo() {
        print(self.lvl.description + " level manager")
        for coworker in coworkers {
            coworker.getInfo()
        }
    }
}

// leaf
class LowLevelManager: Coworker {
    var lvl: Int
    
    init(lvl: Int) {
        self.lvl = lvl
    }
    
    func hire(coworker: Coworker) {
        print("can't hire")
    }
    
    func getInfo() {
        print(self.lvl.description + " level manager")
    }
}

class CompositeExample {
    func execute() {
        
        let topManager = Manager(lvl: 1)
        let managerLvl2 = Manager(lvl: 2)

        let managerLvl3_1 = Manager(lvl: 3)
        let managerLvl3_2 = Manager(lvl: 3)

        let managerLvl10 = Manager(lvl: 10)

        topManager.hire(coworker: managerLvl2)

        managerLvl2.hire(coworker: managerLvl3_1)
        managerLvl2.hire(coworker: managerLvl3_2)

        managerLvl3_1.hire(coworker: managerLvl10)

        topManager.getInfo()

    }
}

