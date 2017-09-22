//
//  Quenstion.swift
//  Quizzler
//
//  Created by Xiaolong Li on 9/21/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    let quenstionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool) {
        quenstionText = text
        answer = correctAnswer
    }
    
}
