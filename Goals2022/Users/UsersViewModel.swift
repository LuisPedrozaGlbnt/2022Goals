//
//  UsersViewModel.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 26/12/22.
//

import Combine

class UsersViewModel {
    
    let users = CurrentValueSubject<[Users.User], Never>([])
    private let api = API()
    var cancellables: Set<AnyCancellable> = []
    
    func viewLoaded() {
        fetchUsers(completion: { error in
            if let error = error {
                print(error)
            }
            return
        })
    }
    
    private func fetchUsers(completion: @escaping(Error?) -> ()) {
        let promise = api.fetchUsers()
        PromiseHandler<Users>.fulfill(promise, storedIn: &cancellables) { [weak self] result in
            switch result {
            case .success(let success):
                self?.users.send(success.users)
            case .failure(let failure):
                completion(failure)
            }
        }
    }
}
