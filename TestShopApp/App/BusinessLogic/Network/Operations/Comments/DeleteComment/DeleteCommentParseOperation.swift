//
//  DeleteCommentParseOperation.swift
//  TestShopApp
//
//  Created by Art on 02.07.2022.
//

import Foundation

final class DeleteCommentParseOperation: Operation {
    private let completion: (Result<Void, Error>) -> Void
    
// MARK: - Init -
    init(completion: @escaping (Result<Void, Error>) -> Void) {
        self.completion = completion
    }
    
// MARK: - Override -
    override func main() {
        guard let deleteOperation = dependencies.first as? DeleteCommentRequestOperation else { return }
        
        if let error = deleteOperation.getError() {
            completion(.failure(error))
        } else {
            completion(.success(Void()))
        }
    }
}
