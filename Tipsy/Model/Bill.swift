//
//  Bill.swift
//  Tipsy
//
//  Created by Mac on 28.02.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Bill {
    var billTotal: Float = 0
    var tipPersent: Int = 0
    var personsCount: Int = 2
    
    mutating func setBillTotal(_ billTotal: Float) {
        self.billTotal = billTotal
    }
    
    mutating func setTipPersent(_ tipPersent: Int) {
        self.tipPersent = tipPersent
    }
    
    mutating func setPersonsCount(_ personsCount: Int) {
        self.personsCount = personsCount
    }
    
    func getNumberPerPerson() -> Float {
        if billTotal <= 0.0 {
            return 0.0
        }
        
        let tipsTotal = tipPersent == 0 ? 0.0 : Float(tipPersent) * billTotal / 100.0
        
        return (billTotal + tipsTotal) / Float(personsCount)
    }
}
