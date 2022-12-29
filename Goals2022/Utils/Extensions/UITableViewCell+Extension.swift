//
//  UITableViewCell+Extension.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 25/12/22.
//

import UIKit

extension UITableViewCell {
    
    static var reuseIdentifier: String {
        String(describing: self)
    }

    var reuseIdentifier: String {
        type(of: self).reuseIdentifier
    }
}
