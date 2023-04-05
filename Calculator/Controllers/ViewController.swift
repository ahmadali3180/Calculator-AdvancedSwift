//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private  var isFinishedTypingNumber: Bool = true
    private var displayValue: Double {
        get {
            guard let numValue = Double(displayLabel.text!) else {fatalError("Can't convert display label text to a double")}
            return numValue
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        if let calcMethod = sender.currentTitle {
            let calculator = CalculatorLogic(number: displayValue)
            guard let result = calculator.calculate(symbol: calcMethod) else {fatalError("The result of calculation is nil.")}
            displayValue = result
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." || displayLabel.text?.last == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                 
                displayLabel.text! += numValue
            }
            
        }
        
    }
    
}

