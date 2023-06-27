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
                .frame(width: scaledWidth, height: buttonWidth)
                .font(.system(size: 35))
                .fontWeight(.semibold)
                .background(backgroundColour)
                .foregroundColor(foregroundColour)
        }
        .cornerRadius(buttonWidth / 2)
    }
}

struct OperationButtonView: View {
    
    let text: String
    let selected: Bool
    
    var bgColour: Color {
        return selected ? Color.white : Color(red: 0, green: 0.573, blue: 0.792)
    }
    
    var fgColour: Color {
        return selected ? Color(red: 0, green: 0.573, blue: 0.792) : Color.white
    }
    
    let function: (String) -> Void
    
    func action() {
        function(text)
    }
    
    var body: some View {
        ButtonView(text: text, backgroundColour: bgColour, foregroundColour: fgColour, action: action)
    }
}

struct NumberButtonView: View {
    
    let text: String
    let scale: CGFloat
    let function: (String) -> Void
    
    init(text: String, scale: CGFloat, function: @escaping (String) -> Void) {
        self.text = text
        self.scale = scale
        self.function = function
    }
    
    init(text: String, function: @escaping (String) -> Void) {
        self.init(text: text, scale: 1.0, function: function)
    }
    
    func action() {
        function(text)
    }
    
    var body: some View {
        ButtonView(text: text, backgroundColour: Color(red: 0.2235294117647059, green: 0.24313725490196078, blue: 0.27450980392156865), scale: scale, action: action)
    }
}

struct SpecialButtonView: View {
    
    let text: String
    
    let function: () -> Void
    
    var body: some View {
        ButtonView(text: text, backgroundColour: Color(red: 0.933, green: 0.933, blue: 0.933), foregroundColour: Color.black, action: function)
    }
}
