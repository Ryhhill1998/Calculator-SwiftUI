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
                        NumberButtonView(value: 7)
                        NumberButtonView(value: 8)
                        NumberButtonView(value: 9)
                        OperationButtonView(text: "x")
                    }
                    
                    HStack(spacing: 12.0) {
                        NumberButtonView(value: 4)
                        NumberButtonView(value: 5)
                        NumberButtonView(value: 6)
                        OperationButtonView(text: "-")
                    }
                    
                    HStack(spacing: 12.0) {
                        NumberButtonView(value: 1)
                        NumberButtonView(value: 2)
                        NumberButtonView(value: 3)
                        OperationButtonView(text: "+")
                    }
                    
                    HStack(spacing: 12.0) {
                        NumberButtonView(value: 0)
                        NumberButtonView(value: 0)
                        NumberButtonView(value: 0)
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

struct ButtonView: View {
    
    let text: String
    let backgroundColour: Color
    var scale: CGFloat = 1.0
    var foregroundColour: Color = Color.white
    
    var width: CGFloat {
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    var body: some View {
        let scaledWidth = scale * width + (scale - 1) * 12
        
        Button {
            print("Button clicked")
        } label: {
            if scale == 2 {
                HStack {
                    Text(text)
                    Spacer()
                }.padding(.leading, 30.0)
            } else {
                Text(text)
            }
        }
        .font(.system(size: 30))
        .frame(width: scaledWidth, height: width)
        .background(backgroundColour)
        .foregroundColor(foregroundColour)
        .cornerRadius(scaledWidth / 2)
    }
}

struct OperationButtonView: View {
    
    let text: String
    
    var body: some View {
        Button {
            print("Button clicked")
        } label: {
            Text(text)
        }
        .font(.system(size: 30))
        .frame(width: buttonWidth, height: buttonWidth)
        .background(Color.orange)
        .foregroundColor(.white)
        .cornerRadius(buttonWidth / 2)
    }
}

struct NumberButtonView: View {
    
    let value: Int
    
    var body: some View {
        Button {
            print("Button clicked")
        } label: {
            Text("\(value)")
        }
        .font(.system(size: 30))
        .frame(width: buttonWidth, height: buttonWidth)
        .background(Color(hue: 1.0, saturation: 0.003, brightness: 0.256))
        .foregroundColor(.white)
        .cornerRadius(buttonWidth / 2)
    }
}

struct SpecialButtonView: View {
    
    let text: String
    
    var body: some View {
        Button {
            print("Button clicked")
        } label: {
            Text(text)
        }
        .font(.system(size: 30))
        .frame(width: buttonWidth, height: buttonWidth)
        .background(Color(hue: 0.0, saturation: 0.011, brightness: 0.732))
        .foregroundColor(.black)
        .cornerRadius(buttonWidth / 2)
    }
}
