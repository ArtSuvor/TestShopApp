//
//  LogoutParseOperation.swift
//  TestShopApp
//
//  Created by Art on 12.06.2022.
//

import Foundation

final class LogoutParseOperation: Operation {
    private let completion: EmptyCompletion
    
// MARK: - Init -
    init(completion: @escaping EmptyCompletion) {
        self.completion = completion
    }
    
// MARK: - Override -
    override func main() {
        guard let logoutOperation = dependencies.first as? LogoutRequestOperation else { return }
        
        if let error = logoutOperation.getError() {
            completion(.failure(error))
        } else {
            completion(.success(Void()))
        }
    }
}
