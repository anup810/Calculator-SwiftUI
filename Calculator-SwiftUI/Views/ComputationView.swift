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
            HStack {
                Spacer()
                Text(currentComputation)
                    .foregroundStyle(foregroundDigitColor)
                    .lineLimit(1)
                    .font(UIDevice.isPad ? .largeTitle : .body)
            }
            .minimumScaleFactor(0.1)
            HStack {
                Spacer()
                Text(mainResult)
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(foregroundDigitColor)
                    .lineLimit(1)
            }
            .minimumScaleFactor(0.1)
        }.padding(.horizontal)
    }
}

#Preview {
    VStack {
        ComputationView(currentComputation: "10/5", mainResult: "2")
        Spacer()
        ComputationView(currentComputation: "5-1", mainResult: "4")
        Spacer()
        ComputationView(currentComputation: "5+1", mainResult: "6")
        Spacer()
        ComputationView(currentComputation: "5*2", mainResult: "10")
    }
}
