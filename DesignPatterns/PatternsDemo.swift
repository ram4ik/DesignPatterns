//
//  PatternsDemo.swift
//  DesignPatterns
//
//  Created by ramil on 06.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct PatternsDemo: View {
    var body: some View {
        VStack(spacing: 15) {
            Group {
                Button(action: {
                    let decorator = DecoratorDemoExecutor()
                    decorator.execute()
                }) {
                    Text("Decorator")
                }
            }
        }
    }
}

struct PatternsDemo_Previews: PreviewProvider {
    static var previews: some View {
        PatternsDemo()
    }
}
