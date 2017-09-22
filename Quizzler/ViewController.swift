//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuenstions = QuenstionBank()
    var pickedAnswer : Bool = false
    var quenstionNumber : Int = 0
    var score : Int = 0
    
    
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nextQuestion()
        
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
  
        if sender.tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        quenstionNumber += 1
       // questionLabel.text = allQuenstions.list[quenstionNumber].quenstionText
        nextQuestion()
        
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score " + String(score)
        progressLabel.text = "\(quenstionNumber + 1)/13 "
        progressBar.frame.size.width = CGFloat((Int)(view.frame.size.width / 13) * quenstionNumber)
    }
    

    func nextQuestion() {
        
        if quenstionNumber <= 12 {
            questionLabel.text = allQuenstions.list[quenstionNumber].quenstionText
        } else {
            
            let alert = UIAlertController(title: "Alert", message: "This is end of quiz", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuenstions.list[quenstionNumber].answer
        
        if correctAnswer == pickedAnswer {
            score += 20
            //scoreLabel.text = String(score)
            
            
            
        } else {
            print("you are wrong!")
        }
        nextQuestion()
        updateUI()
    
        
    }
    
    
    func startOver() {
       quenstionNumber = 0
        //questionLabel.text = allQuenstions.list[0].quenstionText
        nextQuestion()
        
    }
    

    
}
