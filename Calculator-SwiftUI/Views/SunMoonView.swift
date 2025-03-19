//
//  SunMoonView.swift
//  Calculator-SwiftUI
//
//  Created by Anup Saud on 2025-03-17.
//

import SwiftUI

struct SunMoonView: View {
    var lightMode: Bool
    var body: some View {
        HStack(spacing: 30){
            Image(systemName: "sun.min")
                .foregroundStyle(lightMode ? sunOrMoonSelectedColor : sunOrMoonNotSelectedColor)
            Image(systemName: "moon")
                .foregroundStyle(lightMode ? sunOrMoonNotSelectedColor : sunOrMoonSelectedColor)
        }
        .imageScale(.large)
        .font(UIDevice.isPad ? .title : .body)
        .fontWeight(UIDevice.isPad ? .semibold : .regular)
        .padding()
        .background(secondaryBackgroundColor)
        .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    VStack {
        SunMoonView(lightMode: true)
        SunMoonView(lightMode: false)
    }
}

