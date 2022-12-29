//
//  NetworkTableStackView.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 26/12/22.
//

import UIKit

class NetworkTableTabBarController : UITabBarController {
    
    override func loadView() {
        super.loadView()
        
        let usersController = UsersViewController()
        usersController.tabBarItem = UITabBarItem(title: "Users", image: UIImage(systemName: "person.crop.square.fill"), tag: 0)
        
        let postsController = PostsViewController()
        postsController.tabBarItem = UITabBarItem(title: "Posts", image: UIImage(systemName: "bubble.left.fill"), tag: 1)
        
        let commentsController = CommentsViewController()
        commentsController.tabBarItem = UITabBarItem(title: "Comments", image: UIImage(systemName: "bubble.left.and.bubble.right.fill"), tag: 2)
        
        let todosController = TodosViewController()
        todosController.tabBarItem = UITabBarItem(title: "To do", image: UIImage(systemName: "checkmark.square.fill"), tag: 3)
        
        viewControllers = [usersController, postsController, commentsController, todosController]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
