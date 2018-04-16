//
//  QuizView.swift
//  SchoolAid2
//
//  Created by Contreras Tenorio Javier on 8/24/17.
//  Copyright © 2017 jconterast. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

var correctanswers: Int = 0
var wronganswers: Int = 0
var questionsAnswered: Int = questionsLength
var correctPercentage: Double = 0
var lastQuestion = questions.count

class QuizView: UIViewController {
  
    @IBOutlet weak var answLbl: UILabel!
    
   var  length = answers.count
    var randomAnswers:UInt32 = 0
    var cQuestion = 0
    var rightAnswerIndex:UInt32 = 0
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func nextQuestion()
    {
        //UI Label which contains the question is given the text
        //cQuestion = 0
        questionLbl.text = questions[cQuestion]
        //Random number is created (will determine which button is correct)
        rightAnswerIndex = arc4random_uniform(3)+1
        
        // Creating a button
        var btn:UIButton = UIButton()
        
        
        for y in 1...3
        {
            //create the button which will perform an action
            
            btn = view.viewWithTag(y) as! UIButton
            
            if (y == Int(rightAnswerIndex))
            {
                btn.setTitle(rightAnswers[cQuestion], for: .normal)
                //The text of the correct button is set using the rightAnswers array
            }
                else
                {
                btn.setTitle(answers[wrongAnswer()], for: .normal)
                //The text of the wrong buttons is set by using wrongAnswer()
                //which pulls two random answers from the (wrong) answers array
                }
        
        }
        cQuestion += 1
        questNumber.text = "Q: \(String(cQuestion)) / \(questionsLength)"
        print ("Current Question: \(cQuestion)")
        print ("Question count: \(questionsLength)")
        
    }
    
    func wrongAnswer() -> Int{
    let wAnswer = arc4random_uniform(UInt32(answers.count))
    return (Int(wAnswer))
    }
    
    @IBOutlet weak var questNumber: UILabel!
    @IBOutlet weak var questionLbl: UILabel!
    
    @IBAction func actBtn(_ sender: AnyObject)
    {
        if (sender.tag == rightAnswerIndex){
            print ("Correct")
            correctanswers += 1
            correctPercentage = ((Double(questionsLength)-Double(wronganswers))/Double(questionsLength))*100
            self.answLbl.alpha = 0
            self.answLbl.text = "Correct!"
            self.answLbl.textColor = UIColor.white
            self.answLbl.backgroundColor = UIColor.green
            self.answLbl.layer.cornerRadius = 24
            self.answLbl.fadeIn(completion: {
                (finished: Bool) -> Void in
                self.answLbl.fadeOut()
            })
        }
            else {
            wronganswers += 1
            print ("Wrong")
            self.answLbl.alpha = 0
            self.answLbl.text = "Incorrect!"
            self.answLbl.textColor = UIColor.white
            self.answLbl.backgroundColor = UIColor.red
            self.answLbl.layer.cornerRadius = 24
            self.answLbl.fadeIn(completion: {
                (finished: Bool) -> Void in
                self.answLbl.fadeOut()
            })
        }
        if (cQuestion != questionsLength && sender.tag == Int(rightAnswerIndex))
        {
            nextQuestion()
        }
        if (cQuestion == questionsLength && sender.tag == Int(rightAnswerIndex)) {
            performSegue(withIdentifier: "goScore", sender: self)
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
