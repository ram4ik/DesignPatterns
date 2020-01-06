//
//  Playgrounds.swift
//  DesignPatterns
//
//  Created by ramil on 06.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct Playgrounds: View {
    var body: some View {
        VStack(spacing: 15) {
            Group {
                Button(action: {
                    let coffeeMachine = CoffeeMachineExecutor()
                    coffeeMachine.execute()
                }) {
                    Text("CoffeeMachine")
                }
                
                Button(action: {
                    let requestHandling = RequestHandlingExecutor()
                    requestHandling.execute()
                }) {
                    Text("RequestHandling")
                }
            }
        }
    }
}

struct Playgrounds_Previews: PreviewProvider {
    static var previews: some View {
        Playgrounds()
    }
}
