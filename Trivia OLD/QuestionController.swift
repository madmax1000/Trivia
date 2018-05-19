//
//  QuestionController.swift
//  Trivia OLD
//
//  Created by M.D. Bijkerk on 18-05-18.
//  Copyright © 2018 M.D. Bijkerk. All rights reserved.
//

import UIKit

class QuestionController  {
    
    static let shared = QuestionController()
    
    // declare the base URL
    let baseURL = URL(string: "http://jservice.io/api/")!
    
    // fetch a random question from the API
    func fetchRandomQuestion(completion: @escaping ([QuestionObject]?) -> Void) {
        let randomQuestionURL = baseURL.appendingPathComponent("random")
        
        let task = URLSession.shared.dataTask(with: randomQuestionURL) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            
            if let data = data,
                let questions = try? jsonDecoder.decode([QuestionObject].self, from: data) {
                completion(questions)
            }
            else {
                completion(nil)
            }
        }
        task.resume()
    }
    
}

