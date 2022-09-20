//
//  Cell+ResueIdentifier.swift
//  IND Money Demo
//
//  Created by Vivek Singh Mehta on 19/09/22.
//

import Foundation
import  UIKit

protocol ReuseIdentifying {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifying {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

extension UICollectionViewCell: ReuseIdentifying {}
extension UITableViewCell : ReuseIdentifying {}
extension UITableViewHeaderFooterView : ReuseIdentifying {}
