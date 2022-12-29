//
//  PromiseHandler.swift
//  Goals2022
//
//  Created by Luis Antonio Pedroza Laguna on 23/12/22.
//

import Combine

struct PromiseHandler<T: Codable> {
    
    static func fulfill(_ promise: AnyPublisher<T, Error>, storedIn cancellables: inout Set<AnyCancellable>, completion: @escaping(Result<T, Error>) -> ()) {
        promise.sink { result in
            switch result {
            case .finished:
                break
            case .failure(let error):
                completion(.failure(error))
            }
        } receiveValue: { value in
            completion(.success(value))
        }.store(in: &cancellables)
    }
    
}
