//
//  AuthDataOperation.swift
//  TestShopApp
//
//  Created by Art on 11.06.2022.
//

import Foundation

protocol AuthDataOperation {
    func login(login: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
    func logout(userId: Int)
}

final class AuthDataOperationImpl: AuthDataOperation {
    private let operationQueue: OperationQueue
    
    init() {
        self.operationQueue = OperationQueue()
    }
    
// MARK: - Login -
    func login(login: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        let request = LoginRequestOperation(login: login, password: password)
        let parse = LoginParseOperation { result in
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        let operations = [request, parse]
        parse.addDependency(request)
        operationQueue.addOperations(operations, waitUntilFinished: false)
    }
    
// MARK: - Logout -
    func logout(userId: Int) {
        
    }
}
