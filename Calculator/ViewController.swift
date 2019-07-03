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
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        isFinishedTypingNumber = true
        
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert display label text to a Double")
        }
        
        guard let calculationMethod = sender.currentTitle else { fatalError() }
        
        if calculationMethod == "AC" {
            displayLabel.text = "0"
        } else if calculationMethod == "+/-" {
            displayLabel.text = String(number * -1)
        } else if calculationMethod == "%" {
            displayLabel.text = String(number / 100)
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        guard let numValue = sender.currentTitle else { fatalError() }
        
        if isFinishedTypingNumber && numValue == "." {
            displayLabel.text = "0\(numValue)"
            isFinishedTypingNumber = false
        } else if isFinishedTypingNumber && numValue == "0" {
            if displayLabel.text! == "0" {
                return
            } else {
                displayLabel.text = numValue
                return
            }
        } else if isFinishedTypingNumber {
            displayLabel.text = numValue
            isFinishedTypingNumber = false
        } else {
            if numValue == "." {
                for character in displayLabel.text! {
                    if character == "." {
                        return
                    }
                }
            }
            
            displayLabel.text?.append(numValue)
        }
    }

}

