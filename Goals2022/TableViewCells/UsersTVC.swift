//
//  UsersTVC.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 25/12/22.
//

import UIKit

class UsersTVC: UITableViewCell {
    
    private let idLabel = UILabel.multilineCentered()
    private let firstNameLabel = UILabel.multilineCentered()
    private let lastNameLabel = UILabel.multilineCentered()
    private let ageLabel = UILabel.multilineCentered()
    private let genderLabel = UILabel.multilineCentered()
    private let emailLabel = UILabel.multilineCentered()
    private let phoneLabel = UILabel.multilineCentered()
    private let usernameLabel = UILabel.multilineCentered()
    private let birthDateLabel = UILabel.multilineCentered()
    private let heightLabel = UILabel.multilineCentered()
    private let weightLabel = UILabel.multilineCentered()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }
    
    func configCell(user: Users.User) {
        idLabel.attributedText = Formatter.formatText(title: "id", body: String(user.id))
        firstNameLabel.attributedText = Formatter.formatText(title: "firstName", body: user.firstName)
        lastNameLabel.attributedText = Formatter.formatText(title: "lastName", body: user.lastName)
        ageLabel.attributedText = Formatter.formatText(title: "age", body: String(user.age))
        genderLabel.attributedText = Formatter.formatText(title: "gender", body: user.gender)
        emailLabel.attributedText = Formatter.formatText(title: "email", body: user.email)
        phoneLabel.attributedText = Formatter.formatText(title: "phone", body: user.phone)
        usernameLabel.attributedText = Formatter.formatText(title: "username", body: user.username)
        birthDateLabel.attributedText = Formatter.formatText(title: "birthdate", body: user.birthDate)
        heightLabel.attributedText = Formatter.formatText(title: "height", body: String(user.height))
        weightLabel.attributedText = Formatter.formatText(title: "weight", body: String(user.weight))
        
    }

    private func setupView() {
        let stackView = UIStackView.verticalStackView()
        let idStackView = UIStackView.horizontalStackView()
        let nameStackView = UIStackView.horizontalStackView()
        let dataStackView = UIStackView.horizontalStackView()
        let contactStackView = UIStackView.horizontalStackView()
        
        idStackView.addArrengedSubviews(views: [idLabel, ageLabel, genderLabel])
        nameStackView.addArrengedSubviews(views: [firstNameLabel, lastNameLabel, usernameLabel])
        dataStackView.addArrengedSubviews(views: [birthDateLabel, heightLabel, weightLabel])
        contactStackView.addArrengedSubviews(views: [emailLabel, phoneLabel])
        
        stackView.addArrengedSubviews(views: [idStackView, nameStackView, dataStackView, contactStackView])
        
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate(stackView.containInsideView(view: contentView))
    }
}
