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
            
            VStack {
                // output display
                HStack {
                    Spacer()
                    
                    Text("0")
                        .bold()
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                }.padding(.all)
                
                // buttons
                VStack {
                    HStack(spacing: 12.0) {
                        ButtonView()
                        ButtonView()
                        ButtonView()
                        ButtonView()
                    }
                    
                    HStack(spacing: 12.0) {
                        ButtonView()
                        ButtonView()
                        ButtonView()
                        ButtonView()
                    }
                    
                    HStack(spacing: 12.0) {
                        ButtonView()
                        ButtonView()
                        ButtonView()
                        ButtonView()
                    }
                    
                    HStack(spacing: 12.0) {
                        ButtonView()
                        ButtonView()
                        ButtonView()
                        ButtonView()
                    }
                    
                    HStack(spacing: 12.0) {
                        ButtonView()
                        ButtonView()
                        ButtonView()
                        ButtonView()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonView: View {
    
    var width: CGFloat {
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    var body: some View {
        Button {
            print("Button clicked")
        } label: {
            Text("AC")
        }
        .font(.system(size: 30))
        .frame(width: width, height: width)
        .background(Color.orange)
        .foregroundColor(.white)
        .cornerRadius(width / 2)
    }
}
