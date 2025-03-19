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
    let buttonData : [RowOfCalculatorButtonModel] = [
        RowOfCalculatorButtonModel(row: [
            CalculatorButtonModel(calculatorButton: .clear, color: foregroundTopButtonsColor),
            CalculatorButtonModel(calculatorButton: .negative, color: foregroundTopButtonsColor),
            CalculatorButtonModel(calculatorButton: .percent, color: foregroundTopButtonsColor),
            CalculatorButtonModel(calculatorButton: .divide, color: foregroundRIghtButtonsColor),
        ]),
        RowOfCalculatorButtonModel(row: [
            CalculatorButtonModel(calculatorButton: .seven),
            CalculatorButtonModel(calculatorButton: .eight),
            CalculatorButtonModel(calculatorButton: .nine),
            CalculatorButtonModel(calculatorButton: .multiply, color: foregroundRIghtButtonsColor),
                                        ]),
        RowOfCalculatorButtonModel(row: [
            CalculatorButtonModel(calculatorButton: .four),
            CalculatorButtonModel(calculatorButton: .five),
            CalculatorButtonModel(calculatorButton: .six),
            CalculatorButtonModel(calculatorButton: .divide, color: foregroundRIghtButtonsColor),
                                        ]),
        RowOfCalculatorButtonModel(row: [
            CalculatorButtonModel(calculatorButton: .one),
            CalculatorButtonModel(calculatorButton: .two),
            CalculatorButtonModel(calculatorButton: .three),
            CalculatorButtonModel(calculatorButton: .add, color: foregroundRIghtButtonsColor),
                                        ]),
        RowOfCalculatorButtonModel(row: [
            CalculatorButtonModel(calculatorButton: .undo),
            CalculatorButtonModel(calculatorButton: .zero),
            CalculatorButtonModel(calculatorButton: .decimal),
            CalculatorButtonModel(calculatorButton: .equal, color: foregroundRIghtButtonsColor),
                                        ]),
        
    ]
    
    var body: some View {
        Grid(){
            ForEach(buttonData){rowOfCalculatorButtonModel in
                GridRow{
                    ForEach(rowOfCalculatorButtonModel.row){calculatorButtonModel in
                        Button {
                            print("Button Pressed")
                        } label: {
                            ButtonView(
                                calculatorButton: calculatorButtonModel.calculatorButton,
                                foregroundColor: calculatorButtonModel.color,
                                backgroundColor: buttonBackgroundColor
                            )
                        }
   
                    }
                    
                }
                
            }
        }
        .padding()
        .background(secondaryBackgroundColor
            .clipShape(.rect(cornerRadius: 20))
        )
    }
}

#Preview {
    CalculatorButtonView(currentComputation: .constant("5+1"), mainResult: .constant("6"))
}
