//
//  StringHelper.swift
//  Calculator-SwiftUI
//
//  Created by Anup Saud on 2025-03-19.
//
// Returns last Character if it exits
// Otherwise retun an empty string

import Foundation

func getLastChar(str: String) -> String{
    if str.isEmpty{
        return " "
    }else {
        return String(str.last!)
    }
    //return str.isEmpty ? " " : String(str.last!)
    
}
// Return true if last character of str is equal to char
func lastCharacterIsEqualTo(str: String, char: String) -> Bool{
    let last = getLastChar(str: str)
    return last == char
}

func formatResult(value: Double) -> String{
    guard value.isFinite else {
        return "Error"
    }
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 16
    let result = numberFormatter.string(from: NSNumber(value: value))
    return result ?? "0"
}

func lastCharacterIsDigit(str: String) -> Bool{
    return "0123456789".contains(getLastChar(str: str))
}

func lastCharacterIsDigitOrPercent(str: String) -> Bool{
    return "0123456789%".contains(getLastChar(str: str))
}

func lastCharacterIsAnOperator(str: String)-> Bool{
    let last = getLastChar(str: str)
    return operators.contains(last)
}
