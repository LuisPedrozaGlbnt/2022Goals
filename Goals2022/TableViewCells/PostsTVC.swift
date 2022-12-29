//
//  PostsTVC.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 24/12/22.
//

import UIKit

class PostsTVC: UITableViewCell {
    
    private let idLabel = UILabel.multilineCentered()
    private let titleLabel = UILabel.multiline()
    private let bodyLabel = UILabel.multiline()
    private let userIdLabel = UILabel.multilineCentered()
    private let reactionsLabel = UILabel.multilineCentered()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }
    
    func configCell(post: Posts.Post) {
        idLabel.attributedText = Formatter.formatText(title: "id", body: String(post.id))
        titleLabel.attributedText = Formatter.formatText(title: "title", body: post.title)
        bodyLabel.attributedText = Formatter.formatText(title: "body", body: post.body)
        userIdLabel.attributedText = Formatter.formatText(title: "userId", body: String(post.userId))
        reactionsLabel.attributedText = Formatter.formatText(title: "reactions", body: String(post.reactions))
    }

    private func setupView() {
        let stackView = UIStackView.verticalStackView()
        let horizontalStackView = UIStackView.horizontalStackView()
        
        horizontalStackView.addArrengedSubviews(views: [idLabel, userIdLabel, reactionsLabel])
        stackView.addArrengedSubviews(views: [horizontalStackView, titleLabel, bodyLabel])

        contentView.addSubview(stackView)

        NSLayoutConstraint.activate(stackView.containInsideView(view: contentView))
    }

    
}
