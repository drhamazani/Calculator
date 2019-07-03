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
    
    var isFinishedTypingNumber: Bool = true
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        isFinishedTypingNumber = true
        
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        guard let numValue = sender.currentTitle else { fatalError() }
        
        if isFinishedTypingNumber {
            displayLabel.text = numValue
            isFinishedTypingNumber = false
        } else {
            displayLabel.text?.append(numValue)
        }
    }

}

