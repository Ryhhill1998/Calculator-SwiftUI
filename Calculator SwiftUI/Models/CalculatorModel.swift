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
        if number == "." || lastButtonClicked == "number" && currentValue != "0" {
            currentValue = currentValue + number
        } else {
            if result != nil {
                storedValue = result
                result = nil
            }
            
            currentValue = number
            
            if lastButtonClicked == "equals" {
                storedValue = nil
            }
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
            performOperation()
            
            lastButtonClicked = "equals"
        default:
            print("invalid operation")
        }
    }
    
    func processInput() {
        if lastButtonClicked == "operation" { return }
        
        if storedValue != nil {
            performOperation()
            storedValue = currentValue
        } else {
            storedValue = currentValue
            currentValue = "0"
        }
        
        lastButtonClicked = "operation"
    }
    
    func getDoubleFromString(string: String?) -> Double {
        return Double(string ?? "0") ?? 0
    }
    
    func divide(number1: Double, by number2: Double) -> Double {
        print("\(number1) / \(number2) = \(number1 / number2)")
        return number1 / number2
    }
    
    func multiply(number1: Double, by number2: Double) -> Double {
        print("\(number1) x \(number2) = \(number1 * number2)")
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
    
    func performOperation() {
        if let op = chosenOperation {
            let num1 = getDoubleFromString(string: storedValue)
            let num2 = getDoubleFromString(string: currentValue)
            result = "\(op(num1, num2))"
            
            formatResult()
            
            if lastButtonClicked != "equals" {
                storedValue = currentValue
            }
            
            currentValue = result!
        }
    }
    
    func formatResult() {
        guard let unwrappedResult = result else { return }
        
        let splitNumber = unwrappedResult.split(separator: ".")
        
        if splitNumber.count != 2 { return }
        
        guard let decimal = splitNumber.last else { return }
        
        if decimal == "0" {
            let formattedResult = "\(Int(result!)!)"
            result = formattedResult
            currentValue = formattedResult
        }
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
