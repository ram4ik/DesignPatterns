//
//  Decorator.swift
//  DesignPatterns
//
//  Created by Ramill Ibragimov on 31.12.2019.
//  Copyright © 2019 Ramill Ibragimov. All rights reserved.
//

import Foundation

protocol Coffee {
    func cost() -> Double
    func ingredients() -> String
}

final class Espresso: Coffee {
    
    func cost() -> Double {
        return 100
    }
    
    func ingredients() -> String {
        return "Espresso"
    }
}

class CoffeeDecorator: Coffee {
    
    private var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    func cost() -> Double {
        return coffee.cost()
    }
    
    func ingredients() -> String {
        return coffee.ingredients()
    }
 
}

final class Milk: CoffeeDecorator {
    
    override func cost() -> Double {
        return super.cost() + 20
    }
    
    override func ingredients() -> String {
        return super.ingredients() + ", Milk"
    }
}

final class Whip: CoffeeDecorator {
    
    override func cost() -> Double {
        return super.cost() + 30
    }
    
    override func ingredients() -> String {
        return super.ingredients() + ", Whip"
    }
}

final class Chocolate: CoffeeDecorator {
    
    override func cost() -> Double {
        return super.cost() + 50
    }
    
    override func ingredients() -> String {
        return super.ingredients() + ", Chocolate"
    }
}

class DecoratorExecutor {
    
    func execute() {
        let espresso = Espresso()
        let capuccino = Whip(coffee: Milk(coffee: espresso))
        let capuccinoWithChocolate = Chocolate(coffee: capuccino)
        
        print(espresso.ingredients())
        print(espresso.cost())
        
        print(capuccino.ingredients())
        print(capuccino.cost())
        
        print(capuccinoWithChocolate.ingredients())
        print(capuccinoWithChocolate.cost())
    }
}
