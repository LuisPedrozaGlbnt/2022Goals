//
//  CommentsTVC.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 25/12/22.
//

import UIKit

class CommentsTVC: UITableViewCell {
    
    private let idLabel = UILabel.multilineCentered()
    private let postIdLabel = UILabel.multilineCentered()
    private let userIdLabel = UILabel.multilineCentered()
    private let bodyLabel = UILabel.multiline()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }
    
    func configCell(comment: Comments.Comment) {
        idLabel.attributedText = Formatter.formatText(title: "id", body: String(comment.id))
        postIdLabel.attributedText = Formatter.formatText(title: "postId", body: String(comment.postId))
        userIdLabel.attributedText = Formatter.formatText(title: "userId", body: String(comment.user.id))
        bodyLabel.attributedText = Formatter.formatText(title: "body", body: comment.body)
    }

    private func setupView() {
        let stackView = UIStackView.verticalStackView()
        let idStackView = UIStackView.horizontalStackView()
        
        idStackView.addArrengedSubviews(views: [idLabel, postIdLabel, userIdLabel])
        stackView.addArrengedSubviews(views: [idStackView, bodyLabel])

        contentView.addSubview(stackView)

        NSLayoutConstraint.activate(stackView.containInsideView(view: contentView))
    }

    
}
