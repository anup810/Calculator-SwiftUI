//
//  CalculatorButtonModel.swift
//  Calculator-SwiftUI
//
//  Created by Anup Saud on 2025-03-18.
//

import SwiftUI

struct CalculatorButtonModel: Identifiable{
    let id = UUID()
    let calculatorButton: CalculatorButton
    var color: Color = foregroundDigitColor
}

struct RowOfCalculatorButtonModel: Identifiable{
    let id = UUID()
    let row : [CalculatorButtonModel]
}
