//
//  ContentView.swift
//  Calculator SwiftUI
//
//  Created by Ryan Henzell-Hill on 26/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var calculatorModel = CalculatorModel()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 30.0) {
                Spacer()
                
                // output display
                HStack {
                    Spacer()
                    
                    Text(calculatorModel.currentValue)
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 30.0)
                
                // buttons
                VStack(spacing: 12.0) {
                    HStack(spacing: 12.0) {
                        SpecialButtonView(text: "AC", function: clearButtonPressed)
                        SpecialButtonView(text: "+/-", function: changeSignButtonPressed)
                        SpecialButtonView(text: "%", function: clearButtonPressed)
                        OperationButtonView(text: "/", function: operationButtonPressed)
                    }
                    
                    HStack(spacing: 12.0) {
                        NumberButtonView(text: "7", function: numberButtonPressed)
                        NumberButtonView(text: "8", function: numberButtonPressed)
                        NumberButtonView(text: "9", function: numberButtonPressed)
                        OperationButtonView(text: "x", function: operationButtonPressed)
                    }
                    
                    HStack(spacing: 12.0) {
                        NumberButtonView(text: "4", function: numberButtonPressed)
                        NumberButtonView(text: "5", function: numberButtonPressed)
                        NumberButtonView(text: "6", function: numberButtonPressed)
                        OperationButtonView(text: "-", function: operationButtonPressed)
                    }
                    
                    HStack(spacing: 12.0) {
                        NumberButtonView(text: "1", function: numberButtonPressed)
                        NumberButtonView(text: "2", function: numberButtonPressed)
                        NumberButtonView(text: "3", function: numberButtonPressed)
                        OperationButtonView(text: "+", function: operationButtonPressed)
                    }
                    
                    HStack(spacing: 12.0) {
                        NumberButtonView(text: "0", scale: 2.0, function: numberButtonPressed)
                        NumberButtonView(text: ".", function: numberButtonPressed)
                        OperationButtonView(text: "=", function: operationButtonPressed)
                    }
                }
            }
            .padding(.vertical, 12.0)
        }
    }
    
    func operationButtonPressed(text: String) {
        calculatorModel.operationClicked(operation: text)
    }
    
    func numberButtonPressed(text: String) {
        calculatorModel.numberClicked(number: text)
    }
    
    func clearButtonPressed() {
        calculatorModel.resetData()
    }
    
    func changeSignButtonPressed() {
        calculatorModel.changeCurrentValueSign()
    }
}

let buttonWidth = (UIScreen.main.bounds.width - (5 * 12)) / 4

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

