//
//  ButtonView.swift
//  Calculator SwiftUI
//
//  Created by Ryan Henzell-Hill on 27/06/2023.
//

import SwiftUI

struct ButtonView: View {
    
    let text: String
    let backgroundColour: Color
    let foregroundColour: Color
    let scale: CGFloat
    
    init(text: String, backgroundColour: Color, foregroundColour: Color, scale: CGFloat) {
        self.text = text
        self.backgroundColour = backgroundColour
        self.foregroundColour = foregroundColour
        self.scale = scale
    }
    
    init(text: String, backgroundColour: Color, foregroundColour: Color) {
        self.init(text: text, backgroundColour: backgroundColour, foregroundColour: foregroundColour, scale: 1.0)
    }
    
    init(text: String, backgroundColour: Color, scale: CGFloat) {
        self.init(text: text, backgroundColour: backgroundColour, foregroundColour: Color.white, scale: scale)
    }

    init(text: String, backgroundColour: Color) {
        self.init(text: text, backgroundColour: backgroundColour, foregroundColour: Color.white)
    }
    
    var scaledWidth: CGFloat {
        return buttonWidth * scale + (scale - 1) * 12
    }
    
    var body: some View {
        Button {
            print("Button clicked")
        } label: {
            Text(text)
        }
        .font(.system(size: 30))
        .frame(width: scaledWidth, height: buttonWidth)
        .background(backgroundColour)
        .foregroundColor(foregroundColour)
        .cornerRadius(buttonWidth / 2)
    }
}

struct OperationButtonView: View {
    
    let text: String
    
    var body: some View {
        ButtonView(text: text, backgroundColour: Color.orange)
    }
}

struct NumberButtonView: View {
    
    let text: String
    let scale: CGFloat
    
    init(text: String, scale: CGFloat) {
        self.text = text
        self.scale = scale
    }
    
    init(text: String) {
        self.init(text: text, scale: 1.0)
    }
    
    var body: some View {
        ButtonView(text: text, backgroundColour: Color(hue: 1.0, saturation: 0.003, brightness: 0.256), scale: scale)
    }
}

struct SpecialButtonView: View {
    
    let text: String
    
    var body: some View {
        ButtonView(text: text, backgroundColour: Color(hue: 0.0, saturation: 0.011, brightness: 0.732), foregroundColour: Color.black)
    }
}
