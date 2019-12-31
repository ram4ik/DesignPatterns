//
//  Prototype.swift
//  DesignPatterns
//
//  Created by Ramill Ibragimov on 31.12.2019.
//  Copyright © 2019 Ramill Ibragimov. All rights reserved.
//

import Foundation

final class ComplicatedObject {
    
    private var configuration: Data
    
    init(url: URL) {
        let manager = WebManager()
        self.configuration = manager.getData(with: url)
    }
    
    init(object: ComplicatedObject) {
        self.configuration = object.configuration
    }
    
    func clone() -> ComplicatedObject {
        return ComplicatedObject(object: self)
    }
}

final class WebManager {
    
    func getData(with url: URL) -> Data {
        return Data()
    }
}

class PrototypeExecutor {
    
    func execute() {
        
        let object = ComplicatedObject(url: URL(fileURLWithPath: ""))
        let clone = object.clone()
        print(object === clone)
        
        let annotherObject = object
        print(object === annotherObject)
    }
}
