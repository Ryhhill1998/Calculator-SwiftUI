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
    var chosenOperation: String?
    var lastButtonClicked: String?
    
    func numberClicked(number: String) {
        if lastButtonClicked == "number" && currentValue != "0" {
            currentValue = currentValue + number
        } else {
            currentValue = number
        }
        
        print(currentValue)
        
        lastButtonClicked = "number"
    }
    
    func operationClicked(operation: String) {
        switch operation {
        case "/":
            print("divide clicked")
            chosenOperation = operation
            
            if let savedValue = storedValue {
                let result = divide(number1: getDoubleFromString(string: savedValue), by: getDoubleFromString(string: currentValue))
                print(result)
            } else {
                storedValue = currentValue
                currentValue = "0"
            }
        case "x":
            print("multiply clicked")
            chosenOperation = operation
            
            if let savedValue = storedValue {
                let result = multiply(number1: getDoubleFromString(string: savedValue), by: getDoubleFromString(string: currentValue))
                print(result)
            } else {
                storedValue = currentValue
                currentValue = "0"
            }
        case "-":
            print("substract clicked")
            chosenOperation = operation
            
            if let savedValue = storedValue {
                let result = subtract(number1: getDoubleFromString(string: savedValue), number2: getDoubleFromString(string: currentValue))
                print(result)
            } else {
                storedValue = currentValue
                currentValue = "0"
            }
        case "+":
            print("add clicked")
            chosenOperation = operation
            
            if let savedValue = storedValue {
                let result = add(number1: getDoubleFromString(string: savedValue), number2: getDoubleFromString(string: currentValue))
                print(result)
            } else {
                storedValue = currentValue
                currentValue = "0"
            }
        case "=":
            print("equals clicked")
            
            if let savedValue = storedValue {
                let result = divide(number1: getDoubleFromString(string: savedValue), by: getDoubleFromString(string: currentValue))
                print(result)
            } else {
                print(currentValue)
            }
        default:
            print("invalid operation")
        }
        
        lastButtonClicked = "operation"
    }
    
    func getDoubleFromString(string: String) -> Double {
        return Double(string) ?? 0
    }
    
    func divide(number1: Double, by number2: Double) -> Double {
        return number1 / number2
    }
    
    func multiply(number1: Double, by number2: Double) -> Double {
        return number1 * number2
    }
    
    func subtract(number1: Double, number2: Double) -> Double {
        return number1 - number2
    }
    
    func add(number1: Double, number2: Double) -> Double {
        return number1 + number2
    }
}
