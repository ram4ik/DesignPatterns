//
//  DecoratorDemo.swift
//  DesignPatterns
//
//  Created by ramil on 06.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import Foundation

extension UserDefaults {
    func set(date: Date?, forKey key: String) {
        self.set(date, forKey: key)
    }
    
    func date(forKey key: String) -> Date? {
        return self.value(forKey: key) as? Date
    }
}

class DecoratorDemoExecutor {
    func execute() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(date: Date(), forKey: "now")
        print(userDefaults.date(forKey: "now") ?? "?")
    }
}

