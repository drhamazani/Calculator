//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Ahmed Alhamazani on 03/07/2019.
//  Copyright © 2019 OO. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        
        if let n = number {
            if symbol == "AC" {
                return 0
            } else if symbol == "%" {
                return n / 100
            }
        }
        return nil
    }
    
}
