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
                    let templateMethidExample = TemplateMethodExample()
                    templateMethidExample.execute()
                }) {
                    Text("Template method example")
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
