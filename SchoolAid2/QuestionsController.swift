//
//  QuestionsController.swift
//  SchoolAid2
//
//  Created by Contreras Tenorio Javier
//  Copyright © 2017 jconterast. All rights reserved.
//

import UIKit

var questions = [String]()

var answers = [String]()

var rightAnswers = [String]()

let defaults = UserDefaults.standard

var questionsLength = questions.count

class QuestionsController: UIViewController {


    @IBOutlet weak var Qlbl: UILabel!
   
    
    @IBOutlet weak var Qfield: UITextField!
    
    @IBOutlet weak var afield1: UITextField!
    @IBOutlet weak var afield2: UITextField!
    @IBOutlet weak var afield3: UITextField!
   
    
    @IBAction func SaveBtn(_ sender: Any) {
        let questiontext = Qfield.text
            questions.append(questiontext!)
        let answertext1 = afield1.text
            rightAnswers.append(answertext1!)
        let answertext2 = afield2.text
            answers.append(answertext2!)
        let answertext3 = afield3.text
            answers.append(answertext3!)
        let answersLength = answers.count
        questionsLength = questions.count
        print (answersLength)
        print (questionsLength)
        print (questions)
        print (answers)
        Qfield.text = ""
        afield1.text = ""
        afield2.text = ""
        afield3.text = ""
        defaults.set(questions, forKey: "theQuestions")
        defaults.set(answers, forKey: "theAnswers")
        defaults.set(rightAnswers, forKey: "theRights")
        defaults.synchronize()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
