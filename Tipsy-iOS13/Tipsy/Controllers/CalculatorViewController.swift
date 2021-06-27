//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var value: String?
    var stepper: String = ""
    var sum: String = ""
    var totalSum: Float = 0.0
   
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumbrLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    
    
   
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        value = sender.currentTitle ?? "0"
        
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        stepper = Int(sender.value).description
        splitNumbrLabel.text = stepper
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let myFloat = (value! as NSString).floatValue
        sum = billTextField.text ?? "0"
        let sumFloat: Float = (sum as NSString).floatValue
        totalSum = ((sumFloat + (sumFloat * (myFloat/100)))/(stepper as NSString).floatValue)
        print(totalSum)
        performSegue(withIdentifier: "resultPage", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultPage" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.persons = stepper
            destinationVC.tip = value
            destinationVC.eachPart = totalSum
        }
    }
}

