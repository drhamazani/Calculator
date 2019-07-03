//
//  ViewController.swift
//  Calculator
//
//  Created by Ahmed Alhamazani on 03/07/2019.
//  Copyright © 2019 OO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double")
            }
            return number
        }
        set {
            displayLabel.text! = newValue.clean
        }
    }
    
    private var calculator = CalculatorLogic()
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        guard let calculationMethod = sender.currentTitle else { fatalError() }
        
        guard let result = calculator.calculate(symbol: calculationMethod) else {
            fatalError("The result of the calculation is nil")
        }
            
        displayValue = result
    }
    
    @IBAction func changeSignPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = false
        
        if displayLabel.text!.starts(with: "-") {
            displayLabel.text!.remove(at: displayLabel.text!.startIndex)
        } else {
            displayLabel.text! = "-" + displayLabel.text!
        }
        
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        guard let buttonTitle = sender.currentTitle else { fatalError() }
        
        if isFinishedTypingNumber && buttonTitle == "." {
            displayLabel.text = "0\(buttonTitle)"
            isFinishedTypingNumber = false
        } else if isFinishedTypingNumber && buttonTitle == "0" {
            if displayLabel.text! == "0" {
                return
            } else {
                displayLabel.text = buttonTitle
                return
            }
        } else if isFinishedTypingNumber {
            displayLabel.text = buttonTitle
            isFinishedTypingNumber = false
        } else {
            if buttonTitle == "." {
                for character in displayLabel.text! {
                    if character == "." {
                        return
                    }
                }
            }
            
            displayLabel.text?.append(buttonTitle)
        }
    }

}

extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
