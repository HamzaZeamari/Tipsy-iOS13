//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Hamza Zeamari on 29/06/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var result : Double = 0.0
    var numberOfPerson : Int = 0
    var tipValue : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f",result)
        settingLabel.text = "Split between \(numberOfPerson) people, with \(tipValue*100)% tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
