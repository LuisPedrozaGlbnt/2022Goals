//
//  UIStackView+Extension.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 25/12/22.
//

import UIKit

extension UIStackView {
    
    func addArrengedSubviews(views: [UIView]) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
    
    static func verticalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    static func horizontalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    func containInsideView(view: UIView) -> [NSLayoutConstraint] {
        return [
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -8),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
        ]
    }
    
}
