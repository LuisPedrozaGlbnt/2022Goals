//
//  UILabel+Extension.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 25/12/22.
//

import UIKit

extension UILabel {
    
    static func multilineCentered() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }
    
    static func multiline() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }
    
}
