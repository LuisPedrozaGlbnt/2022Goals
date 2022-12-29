//
//  TodosViewModel.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 26/12/22.
//

import Combine

class TodosViewModel {
    
    let todos = CurrentValueSubject<[Todos.Todo], Never>([])
    private let api = API()
    var cancellables: Set<AnyCancellable> = []
    
    func viewLoaded() {
        fetchTodos(completion: { error in
            if let error = error {
                print(error)
            }
            return
        })
    }
    
    private func fetchTodos(completion: @escaping(Error?) -> ()) {
        let promise = api.fetchTodos()
        PromiseHandler<Todos>.fulfill(promise, storedIn: &cancellables) { [weak self] result in
            switch result {
            case .success(let success):
                self?.todos.send(success.todos)
            case .failure(let failure):
                completion(failure)
            }
        }
    }
}
