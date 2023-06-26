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
                        ButtonView(text: "AC", colour: Color(hue: 0.0, saturation: 0.011, brightness: 0.732), scale: 1)
                        ButtonView(text: "+/-", colour: Color(hue: 0.0, saturation: 0.011, brightness: 0.732), scale: 1)
                        ButtonView(text: "%", colour: Color(hue: 0.0, saturation: 0.011, brightness: 0.732), scale: 1)
                        ButtonView(text: "/", colour: Color.orange, scale: 1)
                    }
                    
                    HStack(spacing: 12.0) {
                        ButtonView(text: "7", colour: Color(hue: 1.0, saturation: 0.003, brightness: 0.256), scale: 1)
                        ButtonView(text: "8", colour: Color(hue: 1.0, saturation: 0.003, brightness: 0.256), scale: 1)
                        ButtonView(text: "9", colour: Color(hue: 1.0, saturation: 0.003, brightness: 0.256), scale: 1)
                        ButtonView(text: "x", colour: Color.orange, scale: 1)
                    }
                    
                    HStack(spacing: 12.0) {
                        ButtonView(text: "4", colour: Color(hue: 1.0, saturation: 0.003, brightness: 0.256), scale: 1)
                        ButtonView(text: "5", colour: Color(hue: 1.0, saturation: 0.003, brightness: 0.256), scale: 1)
                        ButtonView(text: "6", colour: Color(hue: 1.0, saturation: 0.003, brightness: 0.256), scale: 1)
                        ButtonView(text: "-", colour: Color.orange, scale: 1)
                    }
                    
                    HStack(spacing: 12.0) {
                        ButtonView(text: "1", colour: Color(hue: 1.0, saturation: 0.003, brightness: 0.256), scale: 1)
                        ButtonView(text: "2", colour: Color(hue: 1.0, saturation: 0.003, brightness: 0.256), scale: 1)
                        ButtonView(text: "3", colour: Color(hue: 1.0, saturation: 0.003, brightness: 0.256), scale: 1)
                        ButtonView(text: "+", colour: Color.orange, scale: 1)
                    }
                    
                    HStack(spacing: 12.0) {
                        ButtonView(text: "0", colour: Color(hue: 1.0, saturation: 0.003, brightness: 0.256), scale: 2)
                        ButtonView(text: ".", colour: Color(hue: 1.0, saturation: 0.003, brightness: 0.256), scale: 1)
                        ButtonView(text: "=", colour: Color.orange, scale: 1)
                    }
                }
            }
            .padding(.vertical, 12.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonView: View {
    
    let text: String
    let colour: Color
    let scale: CGFloat
    
    var width: CGFloat {
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    var body: some View {
        let scaledWidth = scale * width
        
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
        .background(colour)
        .foregroundColor(.white)
        .cornerRadius(scaledWidth / 2)
    }
}
