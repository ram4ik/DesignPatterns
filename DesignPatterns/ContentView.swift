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
        VStack(spacing: 15) {
            
            Group {
                
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
                
                Button(action: {
                    let prototype = PrototypeExecutor()
                    prototype.execute()
                }) {
                    Text("Prototype")
                }
                
                Button(action: {
                    let template = TemplateMethodExecutor()
                    template.execute()
                }) {
                    Text("Template")
                }
                
                Button(action: {
                    let proxy = ProxyExecutor()
                    proxy.execute()
                }) {
                    Text("Proxy")
                }
                
                Button(action: {
                    let composite = CompositeExecutor()
                    composite.execute()
                }) {
                    Text("Composite")
                }
            }
            
            Group {
                
                Button(action: {
                    let chain = ChainOfResponsibilityExecutor()
                    chain.execute()
                }) {
                    Text("Chain of responsibility")
                }
                
                Button(action: {
                    let iterator = IteratorExecutor()
                    iterator.execute()
                }) {
                    Text("Iterator")
                }
                
                Button(action: {
                    let command = CommandExecutor()
                    command.execute()
                }) {
                    Text("Command")
                }
                
                Button(action: {
                    let mediator = MediatorExecutor()
                    mediator.execute()
                }) {
                    Text("Mediator")
                }
                
                Button(action: {
                    let visitor = VisitorExecutor()
                    visitor.execute()
                }) {
                    Text("Visitor")
                }
                
                Button(action: {
                    let flyweight = FlyweightExecutor()
                    flyweight.execute()
                }) {
                    Text("Flyweight")
                }
                
                Button(action: {
                    let state = StateExecutor()
                    state.execute()
                }) {
                    Text("State")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
