//
//  API.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 23/12/22.
//

import Combine
import Networking

class NetworkSetup {
    lazy var network: NetworkingClient = {
        var network = NetworkingClient(baseURL: "https://dummyjson.com")
        network.timeout = 5
        network.logLevel = .off
        return network
    }()
}

struct API: NetworkingService {
    
    var network = NetworkSetup().network
    
    func fetchUsers() -> AnyPublisher<Users, Error> {
        get("/users?limit=100")
    }
    
    func fetchTodos() -> AnyPublisher<Todos, Error> {
        get("/todos?limit=150")
    }
    
    func fetchPosts() -> AnyPublisher<Posts, Error> {
        get("/posts?limit=150")
    }
    
    func fetchComments() -> AnyPublisher<Comments, Error> {
        get("/comments?limit=340")
    }
    
}
