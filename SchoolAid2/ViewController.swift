//
//  ViewController.swift
//  SchoolAid2
//
//  Created by Contreras Tenorio Javier on 8/24/17.
//  Copyright © 2017 jconterast. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBOutlet weak var scoreLbl: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        scoreLbl.text = String(format: "%.2f", arguments: [correctPercentage])
        
        if (correctPercentage < 60) {
            scoreLbl.textColor = UIColor.red
        }
        else if (correctPercentage < 80 && correctPercentage > 59)
        {
            scoreLbl.textColor = UIColor.orange
        }
        else if (correctPercentage > 79)
        {
            scoreLbl.textColor = UIColor.green
        }
    
    }
    
}

