//
//  CommentsModel.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 23/12/22.
//

import Foundation

struct Comments: Codable, Hashable {
    
    struct User: Codable, Hashable {
        var id: Int
    }
    
    struct Comment: Codable, Hashable {
        var id: Int
        var body: String
        var postId: Int
        var user: User
    }
    
    var comments: [Comment]
}
