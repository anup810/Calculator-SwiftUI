//
//  IpadSupport.swift
//  Calculator-SwiftUI
//
//  Created by Anup Saud on 2025-03-19.
//

import SwiftUI

extension UIDevice{
    static var isPad: Bool{
        UIDevice.current.userInterfaceIdiom == .pad
    }
    static var isPhone: Bool{
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
