//
//  Command.swift
//  DesignPatterns
//
//  Created by Ramill Ibragimov on 31.12.2019.
//  Copyright © 2019 Ramill Ibragimov. All rights reserved.
//

import Foundation

final class LightOutside {
    var intensity: Double = 1.0
    
    func switchOn() {
        print("Ligth's switched on")
    }
    func switchOff() {
        print("Light's switched off")
    }
}

final class HeatingCooling {
    var temperature: Double = 21.5
    var mode: String {
        return temperature >= 25 ? "heating" : "cooling"
    }
    
    func start() {
        print("Start \(mode)")
    }
    
    func stop() {
        print("Stop \(mode)")
    }
}

protocol Command {
    func execute()
}

final class SwitchOnLightCommand: Command {
    var light: LightOutside
    
    init(light: LightOutside) {
        self.light = light
    }
    
    func execute() {
        light.switchOn()
    }
}

final class StartHeatingCommand: Command {
    var heater: HeatingCooling
    
    init(heater: HeatingCooling) {
        self.heater = heater
    }
    
    func execute() {
        if heater.temperature < 25 {
            heater.temperature = 25
        }
        heater.start()
    }
}

final class Programm {
    var commands: [Command] = []
    
    func start() {
        commands.forEach { $0.execute() }
    }
}

class CommandExecutor {
    
    func execute() {
        
        let light = LightOutside()
        let heater = HeatingCooling()

        let lightOnCommand = SwitchOnLightCommand(light: light)
        let heatCommand = StartHeatingCommand(heater: heater)

        let eveningProgramm = Programm()
        eveningProgramm.commands.append(lightOnCommand)
        eveningProgramm.commands.append(heatCommand)
        eveningProgramm.start()
    }
}

