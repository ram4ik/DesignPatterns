//
//  ContentView.swift
//  DesignPatterns
//
//  Created by Ramill Ibragimov on 31.12.2019.
//  Copyright © 2019 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Patterns()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Patterns")
            }
            PatternsExamples()
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("PatternsExamples")
            }
            PatternsDemo()
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("PatternsDemo")
            }
            Playgrounds()
                .tabItem {
                    Image(systemName: "4.square.fill")
                    Text("Playgrounds")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
