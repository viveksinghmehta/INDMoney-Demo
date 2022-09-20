//
//  RoundedImageView.swift
//  IND Money Demo
//
//  Created by Vivek Singh Mehta on 19/09/22.
//
import UIKit

class RoundedImageView: UIImageView {
    
    var borderColor: UIColor = .clear
    var showBorder: Bool = false
    var borderWidth: CGFloat = 3.0
    
    override func layoutSubviews() {
        layer.cornerRadius = self.bounds.height / 2
        layer.masksToBounds = true
        if showBorder {
            layer.borderWidth = borderWidth
            layer.borderColor = borderColor.cgColor
        }
    }
    
}
