//
//  DecoratorExample.swift
//  DesignPatterns
//
//  Created by ramil on 07.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import Foundation

protocol Porsche {
    
    func getPrice() -> Double
    func getDescription() -> String
}


class Boxster: Porsche {
    
    func getPrice() -> Double {
        return 120
    }
    
    func getDescription() -> String {
        return "Porsche Boxster"
    }
}


class PorscheDecorator: Porsche {
    
    private let decoratedPorsche: Porsche
    
    required init(dp: Porsche) {
        self.decoratedPorsche = dp
    }
    
    func getPrice() -> Double {
        return decoratedPorsche.getPrice()
    }
    
    func getDescription() -> String {
        return decoratedPorsche.getDescription()
    }
}


class PremiumAudioSystem: PorscheDecorator {
    
    required init(dp: Porsche) {
        super.init(dp: dp)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 30
    }
    
    override func getDescription() -> String {
        return super.getDescription() + " with premium audio system"
    }
}


class PanoramicSunroof: PorscheDecorator {
    
    required init(dp: Porsche) {
        super.init(dp: dp)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 20
    }
    
    override func getDescription() -> String {
        return super.getDescription() + " with panoramic sunroof"
    }
}

class DecoratorExampleExecutor {
    func execute() {
        
        var porscheBoxster: Porsche = Boxster()
        porscheBoxster.getDescription()
        porscheBoxster.getPrice()

        porscheBoxster = PremiumAudioSystem(dp: porscheBoxster)
        porscheBoxster.getDescription()
        porscheBoxster.getPrice()

        porscheBoxster = PanoramicSunroof(dp: porscheBoxster)
        porscheBoxster.getDescription()
        porscheBoxster.getPrice()
    }
}
