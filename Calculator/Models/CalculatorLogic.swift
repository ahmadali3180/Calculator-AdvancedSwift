//
//  CalculatorModel.swift
//  Calculator
//
//  Created by M. Ahmad Ali on 05/04/2023.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    func calculate(symbol: String) -> Double? {
        
        switch symbol {
        case "AC":
            return 0
        case "+/-":
            return number * -1
        case "%":
            return number * 0.01
        default:
            return nil
        }
    }
}
