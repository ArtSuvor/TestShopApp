//
//  AddCommentParseOperation.swift
//  TestShopApp
//
//  Created by Art on 02.07.2022.
//

import Foundation

final class AddCommentParseOperation: Operation {
    private let completion: EmptyCompletion
    
// MARK: - Init -
    init(completion: @escaping EmptyCompletion) {
        self.completion = completion
    }
    
// MARK: - Override -
    override func main() {
        guard let addOperation = dependencies.first as? AddCommentRequestOperation else { return }
        
        if let error = addOperation.getError() {
            completion(.failure(error))
        } else {
            completion(.success(Void()))
        }
    }
}
