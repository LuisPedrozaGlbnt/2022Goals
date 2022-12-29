//
//  CommentsViewModel.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 26/12/22.
//

import Combine

class CommentsViewModel {
    
    let comments = CurrentValueSubject<[Comments.Comment], Never>([])
    private let api = API()
    var cancellables: Set<AnyCancellable> = []
    
    func viewLoaded() {
        fetchComments(completion: { error in
            if let error = error {
                print(error)
            }
            return
        })
    }
    
    private func fetchComments(completion: @escaping(Error?) -> ()) {
        let promise = api.fetchComments()
        PromiseHandler<Comments>.fulfill(promise, storedIn: &cancellables) { [weak self] result in
            switch result {
            case .success(let success):
                self?.comments.send(success.comments)
            case .failure(let failure):
                completion(failure)
            }
        }
    }
}
