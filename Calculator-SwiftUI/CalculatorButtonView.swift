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
            CalculatorButtonModel(calculatorButton: .subtract, color: foregroundRIghtButtonsColor),
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
                            buttonPressed(calcButton: calculatorButtonModel.calculatorButton)
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
    func buttonPressed(calcButton: CalculatorButton){

        switch calcButton{
        case .clear:
            currentComputation = ""
            mainResult = "0"
        case .equal, .negative:
            if !currentComputation.isEmpty{
                if !lastCharacterIsAnOperator(str: currentComputation){
                    let sign = calcButton == .negative ? -1.0 : 1.0
                    mainResult = formatResult(value: sign * calculateResults())
                    
                    if calcButton == .negative {
                        currentComputation = mainResult
                    }
                }
            }
        case .decimal:

            if currentComputation.isEmpty {
                currentComputation = "0."
                return
            }

            let lastChar = getLastChar(str: currentComputation)

            //  Allow decimal after an operator (+, -, *, /)
            if lastCharacterIsAnOperator(str: currentComputation) {
                currentComputation += "0."
                return
            }

            // Get the last number after an operator
            let lastNumber = currentComputation.split(whereSeparator: { "+-*/".contains($0) }).last ?? ""

            //  Prevent multiple decimals in the same number
            if lastNumber.contains(".") {
                return  // Do nothing if the last number already has a decimal
            }

            // Otherwise, append a decimal
            currentComputation += "."

        case .percent:
            if lastCharacterIsDigit(str: currentComputation){
                appendToCurrentComputation(calcButton: calcButton)
            }
            
        case .undo:
            currentComputation = String(currentComputation.dropLast())
            
        case .add,.subtract,.divide,.multiply:
            if lastCharacterIsDigitOrPercent(str: currentComputation){
                appendToCurrentComputation(calcButton: calcButton)
            }
           
        default:
            appendToCurrentComputation(calcButton: calcButton)


        }
        
    }
    func appendToCurrentComputation(calcButton: CalculatorButton){
        currentComputation += calcButton.rawValue
    }
    //implement computation
    func calculateResults() -> Double{
        let visibleWorkings: String = currentComputation
        var workings = visibleWorkings.replacingOccurrences(of: "%", with: "*0.01")
        workings = workings.replacingOccurrences(of: multiplySymbol, with: "*")
        workings = workings.replacingOccurrences(of: divisionSymbol, with: "/")
        
        if getLastChar(str: visibleWorkings) == "."{
            workings += "0"
        }
        let expression = NSExpression(format: workings)
        let expressionvalue = expression.expressionValue(with: nil, context: nil) as!
        Double
        return expressionvalue
    }
}

#Preview {
    CalculatorButtonView(currentComputation: .constant("5+1"), mainResult: .constant("6"))
}
