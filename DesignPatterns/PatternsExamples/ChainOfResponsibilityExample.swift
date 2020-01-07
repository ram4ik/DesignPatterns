//
//  ChainOfResponsibilityExample.swift
//  DesignPatterns
//
//  Created by ramil on 07.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import Foundation

class Enemy {
    let strength = 1600
}

protocol MilitaryChain {
    var strength: Int { get }
    var nextRank: MilitaryChain? { get set }
    func shouldDefeatWithStrength(amount: Int)
}

class Soldier: MilitaryChain {
    var strength = 100
    var nextRank: MilitaryChain?
    func shouldDefeatWithStrength(amount: Int) {
        if amount < strength {
            print("Soldier got it")
        } else {
            nextRank?.shouldDefeatWithStrength(amount: amount)
        }
    }
}

class Officer: MilitaryChain {
    var strength = 500
    var nextRank: MilitaryChain?
    func shouldDefeatWithStrength(amount: Int) {
        if amount < strength {
            print("Officer got it")
        } else {
            nextRank?.shouldDefeatWithStrength(amount: amount)
        }
    }
}

class General: MilitaryChain {
    var strength = 1000
    var nextRank: MilitaryChain?
    func shouldDefeatWithStrength(amount: Int) {
        if amount < strength {
            print("General got it")
        } else {
            print("We can't defeat this enemy")
        }
    }
}

class ChainOfResponsibilityExampleExecutor {
    func execute() {
        let enemy = Enemy()

        let solider = Soldier()
        let officer = Officer()
        let general = General()

        solider.nextRank = officer
        officer.nextRank = general

        solider.shouldDefeatWithStrength(amount: enemy.strength)
    }
}







