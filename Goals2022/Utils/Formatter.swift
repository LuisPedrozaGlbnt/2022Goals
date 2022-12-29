//
//  Formatter.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 25/12/22.
//

import UIKit

class Formatter {
    
    static func formatText(title: String, body: String) -> NSAttributedString {
        let titleFont = UIFont.systemFont(ofSize: 12, weight: .black)
        let bodyFont = UIFont.systemFont(ofSize: 10, weight: .regular)
        
        
        let titleAttributed = NSMutableAttributedString(string: title, attributes: [.font: titleFont])
        let bodyAttributed = NSMutableAttributedString(string: body, attributes: [.font: bodyFont])
        
        titleAttributed.append(NSAttributedString(string: "\n"))
        titleAttributed.append(bodyAttributed)
        
        return titleAttributed
    }
    
}
