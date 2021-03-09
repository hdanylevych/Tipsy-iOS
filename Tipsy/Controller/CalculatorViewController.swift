//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var bill: Bill = Bill()
    
    @IBOutlet weak var zeroPersentsTip: UIButton!
    @IBOutlet weak var tenPersentsTip: UIButton!
    @IBOutlet weak var twentyPersentsTip: UIButton!
    
    @IBOutlet weak var personsCountLabel: UILabel!
    @IBOutlet weak var billTotalTextField: UITextField!
    @IBOutlet weak var personsCountStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        personsCountStepper.addTarget(self, action: #selector(stepperValueDidChanged), for: .allEvents)
        
        bill.setPersonsCount(Int(personsCountStepper.value))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? ResultViewController
        
        destinationVC?.bill = bill
    }
    
    func deselectAllTipButtons() {
        zeroPersentsTip.isSelected = false
        tenPersentsTip.isSelected = false
        twentyPersentsTip.isSelected = false
    }

    @IBAction func tipsSelected(_ sender: UIButton) {
        billTotalTextField.endEditing(true)
        deselectAllTipButtons()
        
        sender.isSelected = true
        
        if zeroPersentsTip.isSelected {
            bill.setTipPersent(0)
        } else if tenPersentsTip.isSelected {
            bill.setTipPersent(10)
        } else if twentyPersentsTip.isSelected {
            bill.setTipPersent(20)
        }
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        var totalString = billTotalTextField.text
        
        totalString = totalString?.replacingOccurrences(of: ",", with: ".")

        bill.setBillTotal(Float(totalString ?? "0") ?? 0.0)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    @objc func stepperValueDidChanged() {
        let stepperDecimalValue = Int(personsCountStepper.value)
        personsCountLabel.text = String(stepperDecimalValue)
        
        bill.setPersonsCount(stepperDecimalValue)
    }
}
