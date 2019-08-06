//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var words = WordData()
    var logic = Logic()
    var letters: String = ""
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var currentLetters: UILabel!
        
    @IBAction func textField(_ sender: UITextField) {

    }
    
    @IBAction func wrongLetterEffect(_ sender: UITextField) {
        wrongLetter(sender: sender)
    }
    
    
    
    @IBAction func afterReturn(_ sender: UITextField) {
        if logic.guess(guessedWord: sender.text!) == true {
            resultLabel.text = "Correct!"
        } else {
            resultLabel.text = "Incorrect!"
        }
    }
    
    
    @IBOutlet var Guesses: [UITextView]!
    
    func wrongLetter(sender: UITextField) {
        
        if sender.text!.contains(letters) {
        } else {
            resultLabel.text = "You can't type that!"
        }
        
    }
//    func addToBank(sender: String){
//        if sender.count == 3 {
//        Guesses += sender
//        }
//    }

    
    override func viewDidLoad() {
        currentLetters.text = logic.displayLetters()
        letters = currentLetters.text!
    super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
    
}

