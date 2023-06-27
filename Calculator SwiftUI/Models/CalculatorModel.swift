//
//  CalculatorModel.swift
//  Calculator SwiftUI
//
//  Created by Ryan Henzell-Hill on 27/06/2023.
//

import Foundation

class CalculatorModel: ObservableObject {
    var storedValue: String?
    @Published var currentValue: String = "0"
    var chosenOperation: ((Double, Double) -> Double)?
    var lastButtonClicked: String?
    
    func numberClicked(number: String) {
        if lastButtonClicked == "number" && currentValue != "0" {
            currentValue = currentValue + number
        } else {
            if lastButtonClicked == "equals" {
                storedValue = currentValue
            }
            currentValue = number
        }
        
        lastButtonClicked = "number"
    }
    
    func operationClicked(operation: String) {
        lastButtonClicked = "operation"
        
        switch operation {
        case "/":
            print("divide clicked")
            chosenOperation = divide
            
            if storedValue != nil {
                operationClicked(operation: "=")
            } else {
                storedValue = currentValue
                currentValue = "0"
            }
        case "x":
            print("multiply clicked")
            chosenOperation = multiply
            
            if storedValue != nil {
                operationClicked(operation: "=")
            } else {
                storedValue = currentValue
                currentValue = "0"
            }
        case "-":
            print("subtract clicked")
            chosenOperation = subtract
            
            if storedValue != nil {
                operationClicked(operation: "=")
            } else {
                storedValue = currentValue
                currentValue = "0"
            }
        case "+":
            print("add clicked")
            chosenOperation = add
            
            if storedValue != nil {
                operationClicked(operation: "=")
            } else {
                storedValue = currentValue
                currentValue = "0"
            }
        case "=":
            print("equals clicked")
            
            if let op = chosenOperation {
                performOperation(number1: getDoubleFromString(string: storedValue), number2: getDoubleFromString(string: currentValue), operation: op)
            }
            
            lastButtonClicked = "equals"
        default:
            print("invalid operation")
        }
    }
    
    func getDoubleFromString(string: String?) -> Double {
        return Double(string ?? "0") ?? 0
    }
    
    func divide(number1: Double, by number2: Double) -> Double {
        return number1 / number2
    }
    
    func multiply(number1: Double, by number2: Double) -> Double {
        return number1 * number2
    }
    
    func subtract(number1: Double, number2: Double) -> Double {
        print("number1: \(number1), number2: \(number2)")
        return number1 - number2
    }
    
    func add(number1: Double, number2: Double) -> Double {
        return number1 + number2
    }
    
    func performOperation(number1: Double, number2: Double, operation: (Double, Double) -> Double) {
        let result = operation(number1, number2)
        storedValue = nil
        currentValue = "\(result)"
    }
    
    func resetData() {
        storedValue = nil
        currentValue = "0"
        chosenOperation = nil
        lastButtonClicked = nil
    }
}
