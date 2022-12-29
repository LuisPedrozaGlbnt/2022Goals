//
//  PostsModel.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 23/12/22.
//

import Foundation

struct Posts: Codable, Hashable {
    
    struct Post: Codable, Hashable {
        var id: Int
        var title: String
        var body: String
        var userId: Int
        var tags: [String]
        var reactions: Int
    }
    
    var posts: [Post]
}
