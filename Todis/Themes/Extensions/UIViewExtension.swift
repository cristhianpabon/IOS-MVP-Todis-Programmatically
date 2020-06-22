//
//  UIViewExtension.swift
//  Todis
//
//  Created by c.pabon.cuellar on 22/04/2020.
//  Copyright © 2020 cristhia.pabon. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    func flipFromLeft(withDuration duration: TimeInterval){
        UIView.animate(withDuration: duration) {
            self.alpha = 0
        }
        UIView.transition(with: self, duration: duration, options: [.transitionFlipFromLeft,.showHideTransitionViews], animations:{
            self.alpha = 1
        }, completion: nil)
    }
    
     func flipFromRight(withDuration duration: TimeInterval){
         UIView.animate(withDuration: duration) {
             self.alpha = 0
         }
         UIView.transition(with: self, duration: duration, options:  [.transitionFlipFromRight,.showHideTransitionViews], animations: {
             self.alpha = 1
         }, completion: nil)
     }
     
     func fadeIn(withDuration duration: TimeInterval){
         UIView.animate(withDuration: duration, animations: {
             self.alpha = 1
         })
     }
     
     func fadeOut(withDuration duration: TimeInterval){
         UIView.animate(withDuration: duration, animations: {
             self.alpha = 0.0
         })
     }
     
     func show(withDuration duration: TimeInterval){
         self.isHidden = true
         UIView.animate(withDuration: duration, animations: {
             self.isHidden = false
         })
     }
     
     func hide(withDuration duration: TimeInterval){
         self.isHidden = false
         UIView.animate(withDuration: duration, animations: {
             self.isHidden = true
         })
     }
     
     func transition(){
         self.alpha = 0.75
         UIView.animate(withDuration: 0.3, animations: {
             self.alpha = 1
         })
     }
}
