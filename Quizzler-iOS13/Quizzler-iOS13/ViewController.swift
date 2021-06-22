//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    
    let quiz = [
        ["Four plus Two equal to Six", "True"],
        ["Ten minus Two is smaller than Five.", "False"],
        ["Forty-Two diveded with Zero is One.", "True"]
    ]
    
    var questionNbr = 0
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
    }

    @IBAction func anwserBtnPressed(_ sender: UIButton) {
        let userAnwser = sender.currentTitle
        let actualAnwser = quiz[questionNbr][1]
       
        if userAnwser == actualAnwser {
            print("Right!")
        }
        else {
            print("Wrong!")
        }
        if questionNbr + 1 < quiz.count {
        questionNbr += 1
        }
        else {
            questionNbr = 0
        }
        updateUI()
    }
    
    func updateUI() {
        
        questionLabel.text = quiz[questionNbr][0]
    }
    
}

