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
    let width: CGFloat
    
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
    
    var buttonDim : CGFloat {
        UIDevice.isPad ? width / 6 : width / 5
    }
    var body: some View {
        ZStack{
            if let text = text{
                Text(text)
            }
            if let systemImage = systemImage{
                Image(systemName: systemImage)
            }
            
        }
        .font(UIDevice.isPad ? .largeTitle : .title2)
        .fontWeight(UIDevice.isPad ? .bold :.semibold)
        .frame(width: buttonDim , height: buttonDim)
        .foregroundStyle(foregroundColor)
        .background(backgroundColor)
        .clipShape(.rect(cornerRadius: 15))
//        .overlay(
//            RoundedRectangle(cornerRadius: 15)
//                .stroke(Color.primary.opacity(0.3), lineWidth: 1) 
//        )
        .shadow(color: backgroundColor.opacity(0.5), radius: 3, x: 5, y: 5)
    }
}

#Preview {
    VStack {
        ButtonView(
            calculatorButton: .one,
            foregroundColor: foregroundDigitColor,
            backgroundColor: buttonBackgroundColor,
            width: 375
        )
        ButtonView(
            calculatorButton: .percent,
            foregroundColor: foregroundDigitColor,
            backgroundColor: buttonBackgroundColor,
            width: 375
        )
        ButtonView(
            calculatorButton: .add,
            foregroundColor: foregroundDigitColor,
            backgroundColor: buttonBackgroundColor,
            width: 375
        )
        ButtonView(
            calculatorButton: .divide,
            foregroundColor: foregroundRIghtButtonsColor,
            backgroundColor: buttonBackgroundColor,
            width: 375
        )
        ButtonView(
            calculatorButton: .negative,
            foregroundColor: foregroundRIghtButtonsColor,
            backgroundColor: buttonBackgroundColor,
            width: 375
        )
    }
}
