//
//  FinalViewController.swift
//  Trivia
//
//  Created by M.D. Bijkerk on 16-05-18.
//  Copyright © 2018 M.D. Bijkerk. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    
    var totalScore: Int!
    var totalQuestionsAnswered: Int!
    
    @IBOutlet weak var finalScoreLabel: UILabel!
    @IBOutlet weak var finalQuestionsAnsweredLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // update the score
        finalScoreLabel.text = String(totalScore)
        finalQuestionsAnsweredLabel.text = String(totalQuestionsAnswered)
    }
    
    
}
