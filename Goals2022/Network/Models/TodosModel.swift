//
//  TodosModel.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 23/12/22.
//

import Foundation

struct Todos: Codable, Hashable {
    
    struct Todo: Codable, Hashable {
        var id: Int
        var todo: String
        var completed: Bool
        var userId: Int
    }
    
    var todos: [Todo]
}
