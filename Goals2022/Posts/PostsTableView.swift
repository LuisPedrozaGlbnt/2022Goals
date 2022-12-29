//
//  PostsTableView.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 26/12/22.
//

import UIKit
import Combine

class PostsTableView: UIView {
    
    var tableView: TableView
    var dataSource: PostsDataSource
    
    init() {
        self.tableView = TableView(style: .insetGrouped)
        self.dataSource = PostsDataSource(tableView: tableView)
        
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
        tableView.register(PostsTVC.self)
        NSLayoutConstraint.activate(tableView.layoutConstraints(in: self))
    }
    
    func reload(with posts: [Posts.Post], animate: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Posts.Post>()
        snapshot.appendSections(Section.allCases)
        
        snapshot.appendItems(posts, toSection: .main)
        
        dataSource.apply(snapshot, animatingDifferences: animate)
    }
}
