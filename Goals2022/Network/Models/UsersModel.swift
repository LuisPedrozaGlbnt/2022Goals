//
//  UsersModel.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 23/12/22.
//

import Foundation

struct Users: Codable, Hashable {
    
    struct User: Codable, Hashable {
        var id: Int
        var firstName: String
        var lastName: String
        var age: Int
        var gender: String
        var email: String
        var phone: String
        var username: String
        var birthDate: String
        var height: Int
        var weight: Double
    }
    
    var users: [User]
}
