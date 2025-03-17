//
//  ContentView.swift
//  Calculator-SwiftUI
//
//  Created by Anup Saud on 2025-03-17.
//

import SwiftUI

struct CalculatorView: View {
    @State var lightMode: Bool = true
    @State var currentComputation: String = ""
    @State var mainResult: String = "0"
    var body: some View {
        ZStack {
            primaryBackgroundColor
                .ignoresSafeArea()
            VStack {
                SunMoonView(lightMode: lightMode)
                    .onTapGesture {
                        withAnimation {
                            lightMode.toggle()
                        }
                    }
                Spacer()
                ComputationView(currentComputation: currentComputation, mainResult: mainResult)
                Spacer()
                CalculatorButtonView(currentComputation: $currentComputation, mainResult: $mainResult)

            }
            .padding()
        }
        .environment(\.colorScheme,
                      lightMode ? .light : .dark
        )
    }
}

#Preview {
    CalculatorView()
}
