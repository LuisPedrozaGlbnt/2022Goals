//
//  TodosViewController.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 26/12/22.
//

import UIKit
import Combine

class TodosViewController: UIViewController {
    
    let todosContainer: TodosTableView
    let todosViewModel: TodosViewModel
    
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        todosContainer = TodosTableView()
        todosViewModel = TodosViewModel()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        todosContainer.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(todosContainer)

        NSLayoutConstraint.activate(todosContainer.inside(view: view))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        todosViewModel.viewLoaded()
        
    }
    
    func setupBindings() {
        todosViewModel.todos.sink { [weak self] todos in
            self?.todosContainer.reload(with: todos)
        }.store(in: &cancellables)
    }
}
