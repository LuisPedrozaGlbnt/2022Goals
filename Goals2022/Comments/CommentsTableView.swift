//
//  CommentsTableView.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 26/12/22.
//

import UIKit
import Combine

class CommentsTableView: UIView {
    
    var tableView: TableView
    var dataSource: CommentsDataSource
    
    init() {
        self.tableView = TableView(style: .insetGrouped)
        self.dataSource = CommentsDataSource(tableView: tableView)
        
        super.init(frame: .zero)
    }
    
    override func layoutSubviews() {
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(tableView)
        tableView.register(CommentsTVC.self)
        NSLayoutConstraint.activate(tableView.layoutConstraints(in: self))
    }
    
    func reload(with comments: [Comments.Comment], animate: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Comments.Comment>()
        snapshot.appendSections(Section.allCases)
        
        snapshot.appendItems(comments, toSection: .main)
        
        dataSource.apply(snapshot, animatingDifferences: animate)
    }
}
