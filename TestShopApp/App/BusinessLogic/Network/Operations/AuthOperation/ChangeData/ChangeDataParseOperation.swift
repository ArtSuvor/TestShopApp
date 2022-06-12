//
//  ChangeDataParseOperation.swift
//  TestShopApp
//
//  Created by Art on 12.06.2022.
//

import Foundation

final class ChangeDataParseOperation: Operation {
    private let completion: (Result<Void, Error>) -> Void
    
// MARK: - Init -
    init(completion: @escaping (Result<Void, Error>) -> Void) {
        self.completion = completion
    }
    
// MARK: - Override -
    override func main() {
        guard let registerOperation = dependencies.first as? ChangeDataRequestOperation else { return }
        
        if let error = registerOperation.getError() {
            completion(.failure(error))
        } else {
            completion(.success(Void()))
        }
    }
}
