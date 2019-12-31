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
            
            Button(action: {
                let decorator = DecoratorExecutor()
                decorator.execute()
            }) {
                Text("Decorator")
            }
            
            Button(action: {
                let adapter = AdapterExecutor()
                adapter.execute()
            }) {
                Text("Adapter")
            }
            
            Button(action: {
                let facade = FacadeExecutor()
                facade.execute()
            }) {
                Text("Facade")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
