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
        VStack(spacing: 20) {
            
            Button(action: {
                let singleton = SingletonExecutor()
                singleton.execute()
            }) {
                Text("Singleton")
            }
            
            Button(action: {
                let observer = ObserverExecutor()
                observer.execute()
            }) {
                Text("Observer")
            }
            
            Button(action: {
                let strategy = StrategyExecutor()
                strategy.execute()
            }) {
                Text("Strategy")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
