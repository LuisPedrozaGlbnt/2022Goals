//
//  TodosTVC.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 25/12/22.
//

import UIKit

class TodosTVC: UITableViewCell {
    
    private let idLabel = UILabel.multilineCentered()
    private let completedLabel = UILabel.multilineCentered()
    private let userIdLabel = UILabel.multilineCentered()
    private let todoLabel = UILabel.multiline()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }
    
    func configCell(todo: Todos.Todo) {
        idLabel.attributedText = Formatter.formatText(title: "id", body: String(todo.id))
        completedLabel.attributedText = Formatter.formatText(title: "completed", body: String(todo.completed))
        userIdLabel.attributedText = Formatter.formatText(title: "userId", body: String(todo.userId))
        todoLabel.attributedText = Formatter.formatText(title: "todo", body: todo.todo)
    }

    private func setupView() {
        let stackView = UIStackView.verticalStackView()
        let idStackView = UIStackView.horizontalStackView()
        
        idStackView.addArrengedSubviews(views: [idLabel, userIdLabel, completedLabel])
        stackView.addArrengedSubviews(views: [idStackView, todoLabel])

        contentView.addSubview(stackView)

        NSLayoutConstraint.activate(stackView.containInsideView(view: contentView))
    }

    
}
