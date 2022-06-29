//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var tip = 0.10
    var result = 0.0
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func tipChanged(_ sender : UIButton){
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        //Get the current title of the button that was pressed.
               let buttonTitle = sender.currentTitle!
               
               //Remove the last character (%) from the title then turn it back into a String.
               let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
               
               //Turn the String into a Double.
               let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
               
               //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
               tip = buttonTitleAsANumber / 100
    }
    @IBAction func stepperValueChanged(_ sender : UIStepper){
        splitNumberLabel.text = String(Int(sender.value))
    }
    @IBAction func calculatePressed(_ sender : UIButton){
        if billTextField.text != nil{
            result = GetBillValue()
            result /= GetSplitNumberValue()
            result = result + result*tip
            print("Valeur du partage : " , result)
            self.performSegue(withIdentifier: "segueTransfer", sender: self)
        }
    }
    func GetSplitNumberValue() -> Double{
        return Double(splitNumberLabel.text!)!
    }
    func GetBillValue() -> Double{
        return Double(billTextField.text!)!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueTransfer" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = result
            destinationVC.numberOfPerson = Int(GetSplitNumberValue())
            destinationVC.tipValue = tip
        }
    }
}

