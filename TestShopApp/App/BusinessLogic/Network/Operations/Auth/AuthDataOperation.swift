//
//  AuthDataOperation.swift
//  TestShopApp
//
//  Created by Art on 11.06.2022.
//

import Foundation

protocol AuthDataOperation: AddingOperations, AnyObject {
    func login(login: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
    func register(request: RegisterRequest, completion: @escaping EmptyCompletion)
    func changeUserData(request: ChangeUserDataRequest, completion: @escaping EmptyCompletion)
    func logout(userId: Int, completion: @escaping EmptyCompletion)
}

final class AuthDataOperationImpl: AuthDataOperation {
    
// MARK: - Login -
    func login(login: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        let request = LoginRequestOperation(login: login, password: password)
        let parse = LoginParseOperation { result in
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        self.addingOperations(request: request, parse: parse)
    }
    
// MARK: - Logout -
    func logout(userId: Int, completion: @escaping EmptyCompletion) {
        let request = LogoutRequestOperation(userId: userId)
        let parse = LogoutParseOperation { result in
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        self.addingOperations(request: request, parse: parse)
    }
    
// MARK: - Register -
    func register(request: RegisterRequest, completion: @escaping EmptyCompletion) {
        let request = RegisterRequestOperation(requestParameters: request)
        let parse = RegisterParseOperation { result in
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        self.addingOperations(request: request, parse: parse)
    }
    
// MARK: - ChangeUserData -
    func changeUserData(request: ChangeUserDataRequest, completion: @escaping EmptyCompletion) {
        let request = ChangeDataRequestOperation(requestParameters: request)
        let parse = ChangeDataParseOperation { result in
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        self.addingOperations(request: request, parse: parse)
    }
}
