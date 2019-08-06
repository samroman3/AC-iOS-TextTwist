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
        for n in sender.text! {
            if letters.contains(n) {
                resultLabel.text = " "
                
            } else {
                resultLabel.text = "You cant use \(sender.text!)!"
                
            }
        }
    }
    
    
    
    @IBAction func afterReturn(_ sender: UITextField) {
        if logic.guess(guessedWord: sender.text!) == true {
            resultLabel.text = "Correct!"
            addToBank(sender: sender.text!)
        } else {
            resultLabel.text = "Incorrect!"
        }
    }
    
    
    
    
    
    @IBOutlet weak var textView3: UITextView!
    @IBOutlet weak var textView4: UITextView!
    @IBOutlet weak var textView5: UITextView!
    @IBOutlet weak var textView6: UITextView!
    
    
//    func wrongLetter(sender: UITextField) {
//            for n in sender.text! {
//            if letters.contains(n) {
//                resultLabel.text = " "
//
//            } else {
//                resultLabel.text = "You cant use that letter!"
//
//            }
//        }
//        }
    
//        if sender.text!.contains(letters) == true {
//            return true
//    } else {
//        return false
//    }
// }

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

    
    override func viewDidLoad() {
        currentLetters.text = logic.displayLetters()
        letters = currentLetters.text!
        resultLabel.text = "Let's Play!"
    super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
    
}

