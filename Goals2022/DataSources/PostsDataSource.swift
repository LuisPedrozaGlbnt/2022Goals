//
//  PostsDataSource.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 24/12/22.
//

import UIKit

enum Section: CaseIterable {
    case main
}

final class PostsDataSource: UITableViewDiffableDataSource<Section, Posts.Post> {
    init(tableView: UITableView) {
        super.init(tableView: tableView, cellProvider: { tableView, indexPath, post in
            let cell = tableView.reuse(PostsTVC.self, indexPath)
            cell.configCell(post: post)
            return cell
        })
    }
}

final class UsersDataSource: UITableViewDiffableDataSource<Section, Users.User> {
    init(tableView: UITableView) {
        super.init(tableView: tableView, cellProvider: { tableView, indexPath, user in
            let cell = tableView.reuse(UsersTVC.self, indexPath)
            cell.configCell(user: user)
            return cell
        })
    }
}

final class CommentsDataSource: UITableViewDiffableDataSource<Section, Comments.Comment> {
    init(tableView: UITableView) {
        super.init(tableView: tableView, cellProvider: { tableView, indexPath, comment in
            let cell = tableView.reuse(CommentsTVC.self, indexPath)
            cell.configCell(comment: comment)
            return cell
        })
    }
}

final class TodosDataSource: UITableViewDiffableDataSource<Section, Todos.Todo> {
    init(tableView: UITableView) {
        super.init(tableView: tableView, cellProvider: { tableView, indexPath, todo in
            let cell = tableView.reuse(TodosTVC.self, indexPath)
            cell.configCell(todo: todo)
            return cell
        })
    }
}
