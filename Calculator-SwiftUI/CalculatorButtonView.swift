//
//  CalculatorButtonView.swift
//  Calculator-SwiftUI
//
//  Created by Anup Saud on 2025-03-17.
//

import SwiftUI

struct CalculatorButtonView: View {
    @Binding var currentComputation: String
    @Binding var mainResult: String
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CalculatorButtonView(currentComputation: .constant("5+1"), mainResult: .constant("6"))
}
