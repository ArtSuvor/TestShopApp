//
//  LoginParseOperation.swift
//  TestShopApp
//
//  Created by Art on 11.06.2022.
//

import Foundation

final class LoginParseOperation: Operation {
    private let completion: (Result<User, Error>) -> Void
    
// MARK: - Init -
    init(completion: @escaping (Result<User, Error>) -> Void) {
        self.completion = completion
    }
    
// MARK: - Override -
    override func main() {
        guard let loginOperation = dependencies.first as? LoginRequestOperation else { return }
        
        if let data = loginOperation.getData() {
            do {
                let loginResult = try JSONDecoder().decode(LoginResult.self, from: data)
                completion(.success(loginResult.user))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        } else if let error = loginOperation.getError() {
            completion(.failure(error))
        }
    }
}
