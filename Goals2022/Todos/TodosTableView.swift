//
//  TodosTableView.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 25/12/22.
//

import UIKit
import Combine

class TodosTableView: UIView {
    
    var tableView: TableView
    var dataSource: TodosDataSource
    
    init() {
        self.tableView = TableView(style: .insetGrouped)
        self.dataSource = TodosDataSource(tableView: tableView)
        
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
        tableView.register(TodosTVC.self)
        NSLayoutConstraint.activate(tableView.layoutConstraints(in: self))
    }
    
    func reload(with todos: [Todos.Todo], animate: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Todos.Todo>()
        snapshot.appendSections(Section.allCases)
        
        snapshot.appendItems(todos, toSection: .main)
        
        dataSource.apply(snapshot, animatingDifferences: animate)
    }
}
