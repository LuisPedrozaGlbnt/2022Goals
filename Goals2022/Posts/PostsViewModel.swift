//
//  PostsViewModel.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 26/12/22.
//

import Combine

class PostsViewModel {
    
    let posts = CurrentValueSubject<[Posts.Post], Never>([])
    private let api = API()
    var cancellables: Set<AnyCancellable> = []
    
    func viewLoaded() {
        fetchPosts(completion: { error in
            if let error = error {
                print(error)
            }
            return
        })
    }
    
    private func fetchPosts(completion: @escaping(Error?) -> ()) {
        let promise = api.fetchPosts()
        PromiseHandler<Posts>.fulfill(promise, storedIn: &cancellables) { [weak self] result in
            switch result {
            case .success(let success):
                self?.posts.send(success.posts)
            case .failure(let failure):
                completion(failure)
            }
        }
    }
}
