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
    var result: String?
    var chosenOperation: ((Double, Double) -> Double)?
    var lastButtonClicked: String?
    
    func numberClicked(number: String) {
        if lastButtonClicked == "number" && currentValue != "0" {
            currentValue = currentValue + number
        } else if number == "." {
            currentValue = "0."
        } else {
            if result != nil {
                storedValue = result
                result = nil
            }
            currentValue = number
        }
        
        lastButtonClicked = "number"
    }
    
    func operationClicked(operation: String) {
        switch operation {
        case "/":
            processInput()
            
            chosenOperation = divide
        case "x":
            processInput()
            
            chosenOperation = multiply
        case "-":
            processInput()
            
            chosenOperation = subtract
        case "+":
            processInput()
            
            chosenOperation = add
        case "=":
            if let op = chosenOperation {
                performOperation(number1: getDoubleFromString(string: storedValue), number2: getDoubleFromString(string: currentValue), operation: op)
            }
        default:
            print("invalid operation")
        }
        
        lastButtonClicked = "operation"
    }
    
    func processInput() {
        if lastButtonClicked == "operation" { return }
        
        if storedValue != nil {
            operationClicked(operation: "=")
        } else {
            storedValue = currentValue
            currentValue = "0"
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
        print("\(number1) - \(number2) = \(number1 - number2)")
        return number1 - number2
    }
    
    func add(number1: Double, number2: Double) -> Double {
        print("\(number1) + \(number2) = \(number1 + number2)")
        return number1 + number2
    }
    
    func performOperation(number1: Double, number2: Double, operation: (Double, Double) -> Double) {
        result = "\(operation(number1, number2))"
        storedValue = nil
        currentValue = result!
    }
    
    func resetData() {
        storedValue = nil
        currentValue = "0"
        chosenOperation = nil
        lastButtonClicked = nil
        result = nil
    }
    
    func changeCurrentValueSign() {
        if currentValue.starts(with: "-") {
            currentValue = currentValue.replacingOccurrences(of: "-", with: "")
        } else {
            currentValue = "-\(currentValue)"
        }
        
        if result != nil {
            result = currentValue
        }
    }
}
