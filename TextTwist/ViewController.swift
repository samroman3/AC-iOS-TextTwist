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
    var added = true
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var currentLetters: UILabel!
        
    @IBAction func textField(_ sender: UITextField) {

    }
    
    @IBAction func wrongLetterEffect(_ sender: UITextField) {
        for n in sender.text! {
            if letters.contains(n) {
                resultLabel.text = " "
                
            } else {
                resultLabel.text = "You cant use \(sender.text!)!"
                
            }
        }
    }
    
    
    
    @IBAction func afterReturn(_ sender: UITextField) {
        if logic.guess(guessedWord: sender.text!) {
            resultLabel.text = "Correct!"
            addToBank(sender: sender.text!)
             } else {
                if logic.guess(guessedWord: sender.text!) == false {
                resultLabel.text = "Incorrect!"
                }
//                else{
//                    if textViews[0]!.text.contains(sender.text!) || textViews[1]!.text.contains(sender.text!) || textViews[2]!.text.contains(sender.text!) || textViews[3]!.text.contains(sender.text!) {
//
//               resultLabel.text = "You already said that!"
                        }
                    }
    
    

    
    
    
    @IBOutlet weak var textView3: UITextView!
    @IBOutlet weak var textView4: UITextView!
    @IBOutlet weak var textView5: UITextView!
    @IBOutlet weak var textView6: UITextView!
    


    func addToBank(sender: String){
        if sender.count == 3 && textView3.text.contains(sender) == false
        {
        textView3.text.append(sender + " ")
        }
        else if sender.count == 4 && textView4.text.contains(sender) == false {
            textView4.text.append(sender + " ")
        } else if sender.count == 5 && textView5.text.contains(sender) == false {
            textView5.text.append(sender + " ")
        } else if sender.count == 6 && textView6.text.contains(sender) == false {
            textView6.text.append(sender + " ")
        }
    }
    
//    func checkIfAdded(sender: UITextField) {
//     let textViews = [textView3,textView4,textView5,textView6]
//     for i in textViews {
//        if i!.text == sender.text! {
//     added = true
//     } else {
//     added = false
//        }
//
//    }
//} // unused function

    override func viewDidLoad() {
        currentLetters.text = logic.displayLetters()
        letters = currentLetters.text!
        resultLabel.text = "Let's Play!"
    super.viewDidLoad()
    }
    
}


