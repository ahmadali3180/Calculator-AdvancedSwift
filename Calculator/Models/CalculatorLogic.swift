//
//  CalculatorModel.swift
//  Calculator
//
//  Created by M. Ahmad Ali on 05/04/2023.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number { 
            switch symbol {
            case "AC":
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n * 0.01
            case "=":
                return twoNumCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func twoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("Operation passed doesn't exist.")
            }
        } else {
            return nil
        }
    }
}
