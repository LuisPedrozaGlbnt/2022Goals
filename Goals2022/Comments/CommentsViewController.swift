//
//  CommentsViewController.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 26/12/22.
//

import UIKit
import Combine

class CommentsViewController: UIViewController {
    
    let commentsContainer: CommentsTableView
    let commentsViewModel: CommentsViewModel
    
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        commentsContainer = CommentsTableView()
        commentsViewModel = CommentsViewModel()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        commentsContainer.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(commentsContainer)

        NSLayoutConstraint.activate(commentsContainer.inside(view: view))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        commentsViewModel.viewLoaded()
        
    }
    
    func setupBindings() {
        commentsViewModel.comments.sink { [weak self] comments in
            self?.commentsContainer.reload(with: comments)
        }.store(in: &cancellables)
    }
}
