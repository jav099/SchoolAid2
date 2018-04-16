//
//  BounceButton.swift
//  SchoolAid2
//
//  Created by Contreras Tenorio Javier
//  Copyright © 2017 jconterast. All rights reserved.
//

import UIKit
//Inherits from the standard UIButton
class BounceButton: UIButton {

    //Tells the responder when the user touches the button
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //the button is transformed to be 20% bigger on the x and y axis
        self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
    //Performs an animation using a timing curve corresponding to the movement of a physical spring
    // sets the animation to last one second, with no delay, with a velocity of 4.
       UIView.animate(withDuration: 1, delay: 0 , usingSpringWithDamping: 0.4, initialSpringVelocity: 4, options: .allowUserInteraction, animations:
    //transforms the button to its default size
        {self.transform = CGAffineTransform.identity
       }, completion: nil)
        
        super.touchesBegan(touches, with: event)
        
    }


}
