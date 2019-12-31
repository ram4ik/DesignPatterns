//
//  Proxy.swift
//  DesignPatterns
//
//  Created by Ramill Ibragimov on 31.12.2019.
//  Copyright © 2019 Ramill Ibragimov. All rights reserved.
//

import Foundation

final class Lock: LockingSystem {
    
    func open() {
        print("Unlock")
    }
    
    func close() {
        print("Lock")
    }
}

protocol LockingSystem {
    func open()
    func close()
}

final class ProxyLock: LockingSystem {
    
    private var lock: Lock = Lock()
    
    func open() {
        print("Additional operations...")
        lock.open()
    }
    
    func close() {
        lock.close()
    }
}

class ProxyExecutor {
    func execute() {
        let lock = ProxyLock()
        lock.open()
    }
}

