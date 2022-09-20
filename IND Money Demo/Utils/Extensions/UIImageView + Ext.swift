//
//  UIImageView+Ext.swift
//  IND Money Demo
//
//  Created by Vivek Singh Mehta on 19/09/22.
//

import UIKit
import Alamofire
import AlamofireImage

extension UIImageView {
    
    func setImage(url: String?, placeholderImage: String) {
        if let urlString = url, let URL = URL(string: urlString) {
            self.af.setImage(withURL: URL, placeholderImage: UIImage(named: placeholderImage))
        } else {
            self.image = UIImage(named: placeholderImage)
        }
    }
    
}
