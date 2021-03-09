//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Mac on 28.02.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bill: Bill?
    
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalPerPersonLabel.text = String(format: "%.2f", bill?.getNumberPerPerson() ?? "0.0")
        
        let personsCount = bill?.personsCount ?? 0
        let tips = bill?.tipPersent ?? 0
        
        descriptionLabel.text = "Split between \(personsCount), with \(tips)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
