//
//  UIViewSub.swift
//  SchoolAid2
//
//  Created by Contreras Tenorio Javier
//  Copyright © 2018 jconterast. All rights reserved.
//

import UIKit
import Foundation
    
    extension UIView {
        
        func fadeIn(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
            UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.alpha = 1.0
            }, completion: completion)  }
        
        func fadeOut(duration: TimeInterval = 0.5, delay: TimeInterval = 1.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
            UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.alpha = 0.0
            }, completion: completion)
        }
        
    }


