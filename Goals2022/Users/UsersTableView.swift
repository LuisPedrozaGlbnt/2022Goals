//
//  UsersTableView.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 26/12/22.
//

import UIKit
import Combine

class UsersTableView: UIView {
    
    var tableView: TableView
    var dataSource: UsersDataSource
    
    init() {
        self.tableView = TableView(style: .insetGrouped)
        self.dataSource = UsersDataSource(tableView: tableView)
        
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
        tableView.register(UsersTVC.self)
        NSLayoutConstraint.activate(tableView.layoutConstraints(in: self))
    }
    
    func reload(with users: [Users.User], animate: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Users.User>()
        snapshot.appendSections(Section.allCases)
        
        snapshot.appendItems(users, toSection: .main)
        
        dataSource.apply(snapshot, animatingDifferences: animate)
    }
}
