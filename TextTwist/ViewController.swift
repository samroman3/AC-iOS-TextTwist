//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var threeLetterTextView: UITextView!
    @IBOutlet weak var fourLetterTextView: UITextView!
    @IBOutlet weak var fiveLetterTextView: UITextView!
    @IBOutlet weak var sixLetterTextView: UITextView!
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var currentLettersLabel: UILabel!
   
    @IBOutlet weak var inputField: UITextField!
    
    var model = TextTwistModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputField.delegate = self
        currentLettersLabel.text = model.currentLetters
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(range.lowerBound, range.upperBound, string)
        //Delete last char is ok
        if range.upperBound - range.lowerBound == 1 && string == "" && textField.text?.count != 0 {
            model.addLetter(textField.text!.last!)
            self.currentLettersLabel.text = model.currentLetters
            return true
        }
        guard string.characters.count == 1 else {
            return false
        }
        let inputChar = Character(string)
        if model.removeLetter(inputChar) {
            currentLettersLabel.text = model.currentLetters
            return true
        } else {
            messageLabel.text = "You can't add \(string)"
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let word = textField.text else {
            return false
        }
        guard (3...6).contains(word.count) else {
            messageLabel.isHidden = false
            messageLabel.text = "Enter 3, 4, 5 or 6 characters"
            return false
        }
        if model.guessedWords.contains(word.lowercased()) {
            messageLabel.isHidden = false
            messageLabel.text = "You already guessed \(word)"
            return false
        }
        if model.guess(word.lowercased()) {
            messageLabel.isHidden = false
            messageLabel.text = "Correct!"
            switch word.count {
            case 3:
                threeLetterTextView.text = threeLetterTextView.text + "\n" + word
            case 4:
                fourLetterTextView.text = fourLetterTextView.text + "\n" + word
            case 5:
                fiveLetterTextView.text = fiveLetterTextView.text + "\n" + word
            case 6:
                sixLetterTextView.text = sixLetterTextView.text + "\n" + word
            default:
                fatalError()
            }
        } else {
            messageLabel.isHidden = false
            messageLabel.text = "\(word) is not correct"
        }
        textField.resignFirstResponder()
        model.resetCurrentLetters()
        currentLettersLabel.text = model.currentLetters
        textField.text = ""
        return true
    }
}

