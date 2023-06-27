//
//  ContentView.swift
//  Calculator SwiftUI
//
//  Created by Ryan Henzell-Hill on 26/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 30.0) {
                Spacer()
                
                // output display
                HStack {
                    Spacer()
                    
                    Text("0")
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                }.padding(.horizontal, 30.0)
                
                // buttons
                VStack(spacing: 12.0) {
                    HStack(spacing: 12.0) {
                        SpecialButtonView(text: "AC")
                        SpecialButtonView(text: "+/-")
                        SpecialButtonView(text: "%")
                        OperationButtonView(text: "/")
                    }
                    
                    HStack(spacing: 12.0) {
                        NumberButtonView(text: "7")
                        NumberButtonView(text: "8")
                        NumberButtonView(text: "9")
                        OperationButtonView(text: "x")
                    }
                    
                    HStack(spacing: 12.0) {
                        NumberButtonView(text: "4")
                        NumberButtonView(text: "5")
                        NumberButtonView(text: "6")
                        OperationButtonView(text: "-")
                    }
                    
                    HStack(spacing: 12.0) {
                        NumberButtonView(text: "1")
                        NumberButtonView(text: "2")
                        NumberButtonView(text: "3")
                        OperationButtonView(text: "+")
                    }
                    
                    HStack(spacing: 12.0) {
                        NumberButtonView(text: "0", scale: 2.0)
                        NumberButtonView(text: ".")
                        OperationButtonView(text: "=")
                    }
                }
            }
            .padding(.vertical, 12.0)
        }
    }
}

let buttonWidth = (UIScreen.main.bounds.width - (5 * 12)) / 4

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

