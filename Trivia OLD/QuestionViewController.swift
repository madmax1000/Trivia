//
//  ViewController.swift
//  Trivia
//
//  Created by M.D. Bijkerk on 14-05-18.
//  Copyright © 2018 M.D. Bijkerk. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var currentAnswer: String = ""
    var currentValue: Int = 0
    var currentScore: Int = 0
    var questionsAnswered: Int = 0
    
    @IBOutlet weak var questionNumber: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerField: UITextField!
    
    // if submit button is pressed, check if answer is correct or not
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        
        // check if the user submitted an answer
        if let submittedAnswer = answerField.text {
            
            // check if the user submitted the correct answer
            if submittedAnswer == currentAnswer {
                currentScore += currentScore + currentValue
                print("Correct answer was given! Score was updated.")
            }
            else {
                print("Wrong answer was given...")
            }
        }
            
        else {
            print("No answer was submitted")
        }
        
        // go to the next question
        viewDidLoad()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // clear the answerField text
        answerField.text = ""
        
        // update the scoreLabel
        scoreLabel.text = String(currentScore)
        
        // update the number of questions left
        questionsAnswered += 1
        questionNumber.text = String(questionsAnswered)
        
        // fetch a random question when the view is loaded
        QuestionController.shared.fetchRandomQuestion { (randomQuestion) in
            if let randomQuestion = randomQuestion {
                print(randomQuestion[0].question)
                print(randomQuestion[0].answer)
                print(randomQuestion[0].value)
                
                // voorgrond/achtergrond draaien verhaal
                DispatchQueue.main.async {
                    
                    // set the questionLabel text equal to question
                    self.questionLabel.text = randomQuestion[0].question
                    
                    // store the answer of the randomQuestion
                    self.currentAnswer = randomQuestion[0].answer
                    
                    // store the value of the randomQuestion
                    self.currentValue = randomQuestion[0].value
                }
            }
        }
    }
    
    // give the currentScore to the final screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFinalSegue" {
            let finalViewController = segue.destination as! FinalViewController
            finalViewController.totalScore = currentScore
            finalViewController.totalQuestionsAnswered = questionsAnswered
        }
    }
    
    
}
