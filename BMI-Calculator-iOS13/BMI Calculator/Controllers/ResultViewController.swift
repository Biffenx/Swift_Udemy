//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Jochum Wilen on 26.6.2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backgroundColor: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        backgroundColor.backgroundColor = color

        
    }
    

    @IBAction func recalcualtePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
