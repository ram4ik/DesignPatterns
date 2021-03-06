//
//  PatternsExamples.swift
//  DesignPatterns
//
//  Created by ramil on 07.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct PatternsExamples: View {
    var body: some View {
        VStack(spacing: 15) {
            Group {
                Button(action: {
                    let builderExample = BuildeExampleExecutor()
                    builderExample.execute()
                }) {
                    Text("Builder example")
                }
                
                Button(action: {
                    let chainOfResponsibilityExample = ChainOfResponsibilityExampleExecutor()
                    chainOfResponsibilityExample.execute()
                }) {
                    Text("Chain of responsibility example")
                }
                
                Button(action: {
                    let proxyExample = ProxyExampleExecutor()
                    proxyExample.execute()
                }) {
                    Text("Proxy example")
                }
                
                Button(action: {
                    let stateExample = StateExampleExecutor()
                    stateExample.execute()
                }) {
                    Text("State example")
                }
                
                Button(action: {
                    let compositeExample = CompositeExampleExecutor()
                    compositeExample.execute()
                }) {
                    Text("Composite example")
                }
                
                Button(action: {
                    let iteratorExample = IteratorExampleExecutor()
                    iteratorExample.execute()
                }) {
                    Text("Iterator example")
                }
                
                Button(action: {
                    let templateMethodExample = TemplateMethodExample()
                    templateMethodExample.execute()
                }) {
                    Text("Template method example")
                }
                
                Button(action: {
                    let facadeExample = FacadeExampleExecutor()
                    facadeExample.execute()
                }) {
                    Text("Facade example")
                }
                
                Button(action: {
                    let adapterExample = AdapterExampleExecutor()
                    adapterExample.execute()
                }) {
                    Text("Adapter example")
                }
            }
            
            Group {
                
                Button(action: {
                    let commandExample = CommandExamleExecutor()
                    commandExample.execute()
                }) {
                    Text("Command example")
                }
                
                Button(action: {
                    let abstractFactoryExample = AbstractFactoryExampleExecutor()
                    abstractFactoryExample.execute()
                }) {
                    Text("Abstract factory example")
                }
                
                Button(action: {
                    let factoryMethodExecutor = FactoryMethodExampleExecutor()
                    factoryMethodExecutor.execute()
                }) {
                    Text("Factory method example")
                }
                
                Button(action: {
                    let simpleFactoryExample = SimpleFactoryExampleExecutor()
                    simpleFactoryExample.execute()
                }) {
                    Text("Simple factory example")
                }
                
                Button(action: {
                    let decoratorExample = DecoratorExampleExecutor()
                    decoratorExample.execute()
                }) {
                    Text("Decorator example")
                }
                
                Button(action: {
                    let observerExample = ObserverExampleExecutor()
                    observerExample.execute()
                }) {
                    Text("Observer example")
                }
                
                Button(action: {
                    let strategyExample = StrategyExampleExecutor()
                    strategyExample.execute()
                }) {
                    Text("Strategy example")
                }
            }
        }
    }
}

struct PatternsExamples_Previews: PreviewProvider {
    static var previews: some View {
        PatternsExamples()
    }
}
