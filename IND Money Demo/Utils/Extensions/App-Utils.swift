//
//  App-Utils.swift
//  IND Money Demo
//
//  Created by Vivek Singh Mehta on 20/09/22.
//
import UIKit

/* Show Progress Indicator */
func showProgressIndicator(view: UIView) {
    
    view.isUserInteractionEnabled = false
    
    // Create and add the view to the screen.
    let progressIndicator = ProgressIndicator(text: "Please wait..")
    progressIndicator.tag = 1
    view.addSubview(progressIndicator)
    
}

/* Hide progress Indicator */
func hideProgressIndicator(view: UIView) {
    
    view.isUserInteractionEnabled = true
    
    if let viewWithTag = view.viewWithTag(1) {
        viewWithTag.removeFromSuperview()
    }
    
}
