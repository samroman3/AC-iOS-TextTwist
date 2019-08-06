//
//  TextTwistModel.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
import UIKit



class Logic {
    var randInfo = WordData.allInfo.randomElement()
    
    

    func guess(guessedWord: String) -> Bool {
        if randInfo!.words.contains(guessedWord) {
            return true
            
        } else {
            return false
        }
    }

    
    func displayLetters () -> String {
        return randInfo!.letters
    }
}



