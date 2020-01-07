//
//  StateExample.swift
//  DesignPatterns
//
//  Created by ramil on 07.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import Foundation

protocol StateExample {
    func on(printer: Printer)
    func off(printer: Printer)
    func printDocument(printer: Printer)
}

class On: StateExample {
    
    func on(printer: Printer) {
        print("it is on already")
    }
    
    func off(printer: Printer) {
        print("turning printer off")
        printer.set(state: Off())
    }
    
    func printDocument(printer: Printer) {
        print("printing")
        printer.set(state: Print())
    }
}

class Off: StateExample {
    
    func on(printer: Printer) {
        print("turning on")
        printer.set(state: On())
    }
    
    func off(printer: Printer) {
        print("it is already off")
    }
    
    func printDocument(printer: Printer) {
        print("it is off, we can't print")
    }
}

class Print: StateExample {
    
    func on(printer: Printer) {
        print("it is on already")
    }
    
    func off(printer: Printer) {
        print("turning printer off")
        printer.set(state: Off())
    }
    
    func printDocument(printer: Printer) {
        print("it is already printing")
    }
}

class Printer {
    var state: StateExample
    
    init() {
        self.state = On()
    }
    
    func set(state: StateExample) {
        self.state = state
    }
    
    func turnOn() {
        state.on(printer: self)
    }
    
    func turnOff() {
        state.off(printer: self)
    }
    
    func printDocument() {
        state.printDocument(printer: self)
    }
}


class StateExampleExecutor {
    func execute() {
        
        let printer = Printer()
        printer.printDocument()
        printer.turnOff()
        printer.turnOn()
        printer.turnOn()
        printer.turnOff()
        printer.turnOff()
    }
}
