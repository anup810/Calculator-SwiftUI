//
//  ButtonView.swift
//  Calculator-SwiftUI
//
//  Created by Anup Saud on 2025-03-17.
//

import SwiftUI

struct ButtonView: View {
    let calculatorButton : CalculatorButton
    let foregroundColor: Color
    let backgroundColor: Color
    
    var systemImage: String? {
        switch calculatorButton {
        case .negative, .undo:
            return calculatorButton.rawValue
        default:
            return nil
        }
    }

    var text: String? {
        return systemImage == nil ? calculatorButton.rawValue : nil
    }
    
    let buttonDim : CGFloat = UIScreen.main.bounds.width / 5
    var body: some View {
        ZStack{
            Text(text ?? "")
            Image(systemName: systemImage ?? "")
        }
        .font(.title2)
        .fontWeight(.semibold)
        .frame(width: buttonDim , height: buttonDim)
        .foregroundStyle(foregroundColor)
        .background(backgroundColor)
        .clipShape(.rect(cornerRadius: 15))
        .shadow(color: backgroundColor.opacity(0.5), radius: 3, x: 5, y: 5)
    }
}

#Preview {
    VStack {
        ButtonView(calculatorButton: .one, foregroundColor: foregroundDigitColor, backgroundColor: buttonBackgroundColor)
        ButtonView(calculatorButton: .percent, foregroundColor: foregroundDigitColor, backgroundColor: buttonBackgroundColor)
        ButtonView(calculatorButton: .add, foregroundColor: foregroundDigitColor, backgroundColor: buttonBackgroundColor)
        ButtonView(calculatorButton: .divide, foregroundColor: foregroundRIghtButtonsColor, backgroundColor: buttonBackgroundColor)
        ButtonView(calculatorButton: .negative, foregroundColor: foregroundRIghtButtonsColor, backgroundColor: buttonBackgroundColor)
    }
}
