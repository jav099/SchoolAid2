//
//  QuizMenu.swift
//  SchoolAid2
//
//  Created by Contreras Tenorio Javier on 8/24/17.
//  Copyright © 2017 jconterast. All rights reserved.
//

import UIKit

class QuizMenu: UIViewController {

   
    @IBAction func resetAll(_ sender: Any) {
    
        questions.removeAll()
        answers.removeAll()
        rightAnswers.removeAll()
        defaults.set(questions, forKey: "theQuestions")
        defaults.set(answers, forKey: "theAnswers")
        defaults.set(rightAnswers, forKey: "theRights")

        print (questions)
        print (answers)
        print (rightAnswers)
    
        defaults.synchronize()
    }
    
    @IBAction func startBtn(_ sender: Any) {
       
        print (questions)
        print (answers)
        print (rightAnswers)
        correctanswers = 0
        questionsAnswered = 0
        wronganswers = 0
    
    }
    
    func warning()
    {
        let warning = UIAlertController(title: "Warning: No Questions For Quiz!", message: "You have not added any questions to the quiz. Application may crash if you attempt to Start Quiz before adding questions.", preferredStyle: .alert)
        let okaction = UIAlertAction(title: "OK", style: .cancel)
        {
            (alert) in
        }
        warning.addAction(okaction)
        
        present(warning, animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questions = defaults.stringArray(forKey: "theQuestions") ?? [String]()
        answers = defaults.stringArray(forKey: "theAnswers") ?? [String]()
        rightAnswers = defaults.stringArray(forKey: "theRights") ?? [String]()
    }

    override func viewDidAppear(_ animated: Bool){
        if questions.count == 0
        {
            warning()
        }
        else {
            print("Hello")
        }
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func printBtn(_ sender: Any) {
        print("questions:\(questions)")
        print("Answers:\(rightAnswers)")
        print("Wrong Answers:\(answers)")

    }
    


}
