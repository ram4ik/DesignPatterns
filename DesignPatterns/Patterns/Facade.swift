//
//  Facade.swift
//  DesignPatterns
//
//  Created by Ramill Ibragimov on 31.12.2019.
//  Copyright © 2019 Ramill Ibragimov. All rights reserved.
//

import Foundation

final class Machine {
    enum State {
        case notRunning
        case ready
        case running
    }
    
    private(set) var state: State = .ready
    
    func startMachine() {
        print("Process starting...")
        state = .ready
        state = .running
        print("MACHINE IS RUNNING")
    }
    
    func stopMachine() {
        print("Process stoping...")
        state = .notRunning
        print("MACHINE STOPPED")
    }
}

final class RequestManager {
    
    var isConnected: Bool = false
    
    func connectToTerminal() {
        print("Connecting to terminal...")
        isConnected = true
    }
    
    func disconnectToTerminal() {
        print("Disconnecting to terminal...")
        isConnected = false
    }
    
    func getStatusRequest(for machine: Machine) -> Machine.State {
        print("Sending status request...")
        return machine.state
    }
    
    func sendStartRequest(for machine: Machine) {
        print("Sending request to start the machine...")
        machine.startMachine()
    }
    
    func sendStopRequest(for machine: Machine) {
        print("Sending request to stop the machine...")
        machine.stopMachine()
    }
}

protocol Facade {
    func startMachine()
}

final class ConcreteFacade: Facade {
    func startMachine() {
        
        let machine = Machine()
        let manager = RequestManager()
        
        if !manager.isConnected {
            manager.connectToTerminal()
        }
        
        if manager.getStatusRequest(for: machine) == .ready {
            print("MACHINE IS READY")
            manager.sendStartRequest(for: machine)
        }
    }
}

class FacadeExecutor {
    func execute() {
        
        let simpleInterface = ConcreteFacade()
        simpleInterface.startMachine()
    }
}
