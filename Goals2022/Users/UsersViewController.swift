//
//  UsersViewController.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 26/12/22.
//

import UIKit
import Combine

class UsersViewController: UIViewController {
    
    let usresContainer: UsersTableView
    let usersViewModel: UsersViewModel
    
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        usresContainer = UsersTableView()
        usersViewModel = UsersViewModel()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        usresContainer.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(usresContainer)

        NSLayoutConstraint.activate(usresContainer.inside(view: view))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        usersViewModel.viewLoaded()
        
    }
    
    func setupBindings() {
        usersViewModel.users.sink { [weak self] users in
            self?.usresContainer.reload(with: users)
        }.store(in: &cancellables)
    }
}

