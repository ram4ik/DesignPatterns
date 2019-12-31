//
//  Adapter.swift
//  DesignPatterns
//
//  Created by Ramill Ibragimov on 31.12.2019.
//  Copyright © 2019 Ramill Ibragimov. All rights reserved.
//

import Foundation

protocol BMRImperialCalculation {
    func bmr(height: Double, weight: Double, age: Int) -> Int
}

struct BMRCalculator: BMRImperialCalculation {
    func bmr(height: Double, weight: Double, age: Int) -> Int {
        return Int(66 + (6.2 * weight) + (12.7 * height) - (6.76 * Double(age)))
    }
}

protocol BMRMetricCalculation {
    func metricBMR(height: Double, weight: Double, age: Int) -> String
}

struct BMRCalculatorAdapter: BMRMetricCalculation {
    
    private var adaptee: BMRImperialCalculation
    
    init(adaptee: BMRImperialCalculation) {
        self.adaptee = adaptee
    }
    
    func metricBMR(height: Double, weight: Double, age: Int) -> String {
        let iHeight = height * 3.28084
        let iWeight = weight * 2.20462
        let result = adaptee.bmr(height: iHeight, weight: iWeight, age: age)
        return "BMR is \(result). \(result > 1000 ? "High." : "Low.")"
    }
}

struct Person {
    func checkBMR(calculator: BMRMetricCalculation) {
        print(calculator.metricBMR(height: 1.84, weight: 74, age: 26))
    }
}

class AdapterExecutor {
    
    func execute() {
        let person = Person()
        person.checkBMR(calculator: BMRCalculatorAdapter(adaptee: BMRCalculator()))
    }
}
