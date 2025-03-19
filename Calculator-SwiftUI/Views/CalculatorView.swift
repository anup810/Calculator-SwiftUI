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
        GeometryReader { geo in
            VStack {
                SunMoonView(lightMode: lightMode)
                    .onTapGesture {
                        withAnimation {
                            lightMode.toggle()
                        }
                    }
                Spacer()
                ComputationView(currentComputation: currentComputation, mainResult: mainResult)
                    .padding(.horizontal, UIDevice.isPad ? geo.size.width * 0.1 : 0)
                Spacer()
                CalculatorButtonView(
                    currentComputation: $currentComputation,
                    mainResult: $mainResult,
                    width: geo.size.width
                )
            }
            .padding()
        }
        .environment(\.colorScheme, lightMode ? .light : .dark)
    }
}


#Preview {
    CalculatorView()
        
}
