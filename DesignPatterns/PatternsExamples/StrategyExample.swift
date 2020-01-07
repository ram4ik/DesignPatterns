//
//  StrategyExample.swift
//  DesignPatterns
//
//  Created by ramil on 07.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import Foundation

protocol SwimBehavior {
    
    func swim()
}

class ProfessionalSwimmer: SwimBehavior {
    
    func swim() {
        print("professional swimming")
    }
}

class NonSwimmer: SwimBehavior {
    
    func swim() {
        print("non-swimming")
    }
}

protocol DiveBehavior {
    
    func dive()
}


class ProfessionalDiver: DiveBehavior {
    
    func dive() {
        print("professional diving")
    }
}


class NewbieDiver: DiveBehavior {
    
    func dive() {
        print("newbie diving")
    }
}

class NonDiver: DiveBehavior {
    
    func dive() {
        print("non-diving")
    }
}


class Human {
    
    private var diveBehavior: DiveBehavior!
    private var swimBehavior: SwimBehavior!
    
    func performSwim() {
        
        swimBehavior.swim()
    }
    
    func performDive() {
        
        diveBehavior.dive()
    }
    
    func setSwimBehavior(sb: SwimBehavior) {
        
        self.swimBehavior = sb
    }
    
    func setDiveBehavior(db: DiveBehavior) {
        
        self.diveBehavior = db
    }
    
    func run() {
        
        print("running")
    }
    
    init(swimBehavior: SwimBehavior, diveBehavior: DiveBehavior) {
        self.swimBehavior = swimBehavior
        self.diveBehavior = diveBehavior
    }
}


class StrategyExampleExecutor {
    func execute() {
        
        let human = Human(swimBehavior: ProfessionalSwimmer(), diveBehavior: ProfessionalDiver())
        human.setSwimBehavior(sb: NonSwimmer())
        human.performDive()
        human.performSwim()
    }
}
