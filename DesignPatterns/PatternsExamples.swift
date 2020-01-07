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
            }
        }
    }
}

struct PatternsExamples_Previews: PreviewProvider {
    static var previews: some View {
        PatternsExamples()
    }
}
