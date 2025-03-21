//
//  Enumerations.swift
//  Calculator-SwiftUI
//
//  Created by Anup Saud on 2025-03-17.
//

import Foundation

enum Operations{
    case add, subtract, multiply, divide, equal, none
}
enum CalculatorButton: String{
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case multiply = "×"
    case equal = "="
    case decimal = "."
    case clear = "AC"
    case percent = "%"
    case negative = "plus.slash.minus"
    case undo = "arrow.uturn.left"
    
}
let enumOperators: [CalculatorButton] = [.add, .subtract, .divide,.multiply]

let multiplySymbol: String = CalculatorButton.multiply.rawValue
let divisionSymbol: String = CalculatorButton.divide.rawValue

let operators: String = "+-\(multiplySymbol)\(divisionSymbol)"
