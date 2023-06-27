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
    let action: () -> Void
    
    init(text: String, backgroundColour: Color, foregroundColour: Color, scale: CGFloat, action: @escaping () -> Void) {
        self.text = text
        self.backgroundColour = backgroundColour
        self.foregroundColour = foregroundColour
        self.scale = scale
        self.action = action
    }
    
    init(text: String, backgroundColour: Color, foregroundColour: Color, action: @escaping () -> Void) {
        self.init(text: text, backgroundColour: backgroundColour, foregroundColour: foregroundColour, scale: 1.0, action: action)
    }
    
    init(text: String, backgroundColour: Color, scale: CGFloat, action: @escaping () -> Void) {
        self.init(text: text, backgroundColour: backgroundColour, foregroundColour: Color.white, scale: scale, action: action)
    }

    init(text: String, backgroundColour: Color, action: @escaping () -> Void) {
        self.init(text: text, backgroundColour: backgroundColour, foregroundColour: Color.white, action: action)
    }
    
    var scaledWidth: CGFloat {
        return buttonWidth * scale + (scale - 1) * 12
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
        }
        .font(.system(size: 30))
        .fontWeight(.semibold)
        .frame(width: scaledWidth, height: buttonWidth)
        .background(backgroundColour)
        .foregroundColor(foregroundColour)
        .cornerRadius(buttonWidth / 2)
    }
}

struct OperationButtonView: View {
    
    let text: String
    
    func action() {
        print("Operation button clicked")
    }
    
    var body: some View {
        ButtonView(text: text, backgroundColour: Color.orange, action: action)
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
    
    func action() {
        print("Number button clicked")
    }
    
    var body: some View {
        ButtonView(text: text, backgroundColour: Color(hue: 1.0, saturation: 0.003, brightness: 0.256), scale: scale, action: action)
    }
}

struct SpecialButtonView: View {
    
    let text: String
    
    func action() {
        print("Special button clicked")
    }
    
    var body: some View {
        ButtonView(text: text, backgroundColour: Color(hue: 0.0, saturation: 0.011, brightness: 0.732), foregroundColour: Color.black, action: action)
    }
}
