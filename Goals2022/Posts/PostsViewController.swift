//
//  PostsViewController.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 26/12/22.
//

import UIKit
import Combine

class PostsViewController: UIViewController {
    
    let postsContainer: PostsTableView
    let postsViewModel: PostsViewModel
    
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        postsContainer = PostsTableView()
        postsViewModel = PostsViewModel()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        postsContainer.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(postsContainer)

        NSLayoutConstraint.activate(postsContainer.inside(view: view))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        postsViewModel.viewLoaded()
        
    }
    
    func setupBindings() {
        postsViewModel.posts.sink { [weak self] posts in
            self?.postsContainer.reload(with: posts)
        }.store(in: &cancellables)
    }
}
