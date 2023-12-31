//
//  ContentView.swift
//  Calculator SwiftUI
//
//  Created by Ryan Henzell-Hill on 26/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var calculatorModel = CalculatorModel()
    
    @State var selectedOperationButton: String?
    
    var body: some View {
        ZStack {
            Color(red: 0.133, green: 0.157, blue: 0.192).ignoresSafeArea()
            
            VStack(spacing: 30.0) {
                Spacer()
                
                // output display
                HStack {
                    Spacer()
                    
                    Text(calculatorModel.currentValue)
                        .font(.system(size: 80))
                        .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .minimumScaleFactor(0.8)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .lineLimit(1)
                }
                .padding(.horizontal, 30.0)
                
                // buttons
                VStack(spacing: 12.0) {
                    HStack(spacing: 12.0) {
                        SpecialButtonView(text: "C", function: clearButtonPressed)
                        SpecialButtonView(text: "+/-", function: changeSignButtonPressed)
                        SpecialButtonView(text: "%", function: clearButtonPressed)
                        OperationButtonView(text: "/", selected: selectedOperationButton == "/", function: operationButtonPressed)
                    }
                    
                    HStack(spacing: 12.0) {
                        NumberButtonView(text: "7", function: numberButtonPressed)
                        NumberButtonView(text: "8", function: numberButtonPressed)
                        NumberButtonView(text: "9", function: numberButtonPressed)
                        OperationButtonView(text: "x", selected: selectedOperationButton == "x", function: operationButtonPressed)
                    }
                    
                    HStack(spacing: 12.0) {
                        NumberButtonView(text: "4", function: numberButtonPressed)
                        NumberButtonView(text: "5", function: numberButtonPressed)
                        NumberButtonView(text: "6", function: numberButtonPressed)
                        OperationButtonView(text: "-", selected: selectedOperationButton == "-", function: operationButtonPressed)
                    }
                    
                    HStack(spacing: 12.0) {
                        NumberButtonView(text: "1", function: numberButtonPressed)
                        NumberButtonView(text: "2", function: numberButtonPressed)
                        NumberButtonView(text: "3", function: numberButtonPressed)
                        OperationButtonView(text: "+", selected: selectedOperationButton == "+", function: operationButtonPressed)
                    }
                    
                    HStack(spacing: 12.0) {
                        NumberButtonView(text: "0", scale: 2.0, function: numberButtonPressed)
                        NumberButtonView(text: ".", function: numberButtonPressed)
                        OperationButtonView(text: "=", selected: false, function: operationButtonPressed)
                    }
                }
            }
            .padding(.vertical, 12.0)
        }
    }
    
    func operationButtonPressed(text: String) {
        calculatorModel.operationClicked(operation: text)
        selectedOperationButton = text
    }
    
    func numberButtonPressed(text: String) {
        calculatorModel.numberClicked(number: text)
        selectedOperationButton = nil
    }
    
    func clearButtonPressed() {
        calculatorModel.resetData()
        selectedOperationButton = nil
    }
    
    func changeSignButtonPressed() {
        calculatorModel.changeCurrentValueSign()
        selectedOperationButton = nil
    }
}

let buttonWidth = (UIScreen.main.bounds.width - (5 * 12)) / 4

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

