//
//  CoffeeMachine.swift
//  DesignPatterns
//
//  Created by ramil on 06.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import Foundation

fileprivate protocol CoffeeMachineState {
    func isReadyToBrew() -> Bool
    func brew()
}

extension CoffeeMachineState {
    func isReadyToBrew() -> Bool {
        print("\(#function) not implemented for \(self) state")
        return false
    }
    
    func brew() {
        print("\(#function) not implemented for \(self) state")
    }
}

fileprivate struct StandbyState: CoffeeMachineState {
    
}

fileprivate struct FillWaterTankState: CoffeeMachineState {
    var context: CoffeeMachine
    
    func isReadyToBrew() -> Bool {
        guard context.isWaterTankFilled else {
            print("Fill water tank!")
            context.state = StandbyState()
            return false
        }
        context.state = EmptyCapsuleBinState(context: context)
        return context.state.isReadyToBrew()
    }
}

fileprivate struct EmptyCapsuleBinState: CoffeeMachineState {
    var context: CoffeeMachine
    
    func isReadyToBrew() -> Bool {
        guard context.isCapsuleBinEmpty else {
            print("Empty capsule bin tank!")
            context.state = StandbyState()
            return false
        }
        
        context.state = InsertCapsuleState(context: context)
        return context.state.isReadyToBrew()
    }
}

fileprivate struct InsertCapsuleState: CoffeeMachineState {
    var context: CoffeeMachine
    
    func isReadyToBrew() -> Bool {
        guard context.isCapsuleInserted else {
            print("Coffee capsule not inserted!")
            context.state = StandbyState()
            return false
        }
        
        return true
    }
}

fileprivate struct BrewCoffeeState: CoffeeMachineState {
    var context: CoffeeMachine
    
    func brew() {
        context.state = FillWaterTankState(context: context)
        guard context.state.isReadyToBrew() else {
            print("Something went wrong!")
            context.state = StandbyState()
            return
        }
        
        print("Coffee ready")
        context.state = StandbyState()
    }
}

class CoffeeMachine {
    fileprivate var isWaterTankFilled: Bool
    fileprivate var isCapsuleBinEmpty: Bool
    fileprivate var isCapsuleInserted: Bool
    
    fileprivate var state: CoffeeMachineState = StandbyState()

    required init(waterFilled: Bool, binEmpty: Bool, capsuleInserted: Bool) {
        isWaterTankFilled = waterFilled
        isCapsuleBinEmpty = binEmpty
        isCapsuleInserted = capsuleInserted
    }
    
    func brew() {
        state = BrewCoffeeState(context: self)
        state.brew()
    }
}

class CoffeeMachineExecutor {
    func execute() {
        let coffeeMachine = CoffeeMachine(waterFilled: true, binEmpty: true, capsuleInserted: true)
        coffeeMachine.brew()
    }
}


