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
    
    let allQuestion = QuestionBank()
    var pickedAnswer = false
    var questionNumber = 0
    var score = 0
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedAnswer = true
            } else {
            pickedAnswer = false
        }
        checkAnswer()
        nextQuestion()
    }
    
    
    func updateUI() {
      progressLabel.text = String(questionNumber+1)
      progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
      scoreLabel.text = String(score)
      questionLabel.text = allQuestion.list[questionNumber].questionText
        

    }
    

    func nextQuestion() {
        if questionNumber == allQuestion.list.count - 1 {
            let alert = UIAlertController(title: "You did it!", message: "You did it, you completed the quiz", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
            self.startOver()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }else{
            questionNumber += 1
            updateUI()
        }
  
    }
    
    
    func checkAnswer() {
        if pickedAnswer == allQuestion.list[questionNumber].answer {
            score += 1
        }
    }
    
    
    func startOver() {
        questionNumber = 0
        score = 0
        updateUI()
    }
    

    
}
