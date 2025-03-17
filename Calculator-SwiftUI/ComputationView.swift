//
//  ComputationView.swift
//  Calculator-SwiftUI
//
//  Created by Anup Saud on 2025-03-17.
//

import SwiftUI

struct ComputationView: View {
    let currentComputation: String
    let mainResult: String
    var body: some View {
        VStack {
            Text(currentComputation)
            Text(mainResult)
        }
    }
}

#Preview {
    ComputationView(currentComputation: "5+1", mainResult: "6")
}
