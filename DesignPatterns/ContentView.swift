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
            PatternsDemo()
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("PatternsDemo")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
