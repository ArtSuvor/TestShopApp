//
//  AuthInteractor.swift
//  TestShopApp
//
//  Created Art on 11.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Alamofire

final class AuthInteractor {
    weak var output: AuthInteractorOutput!
    private let operation: AuthDataOperation!

    init(operation: AuthDataOperation) {
        self.operation = operation
    }
}

// MARK: - AuthInteractorInput
extension AuthInteractor: AuthInteractorInput {
    func signIn(login: String, password: String) {
        operation.login(login: login, password: password) {[weak self] result in
            switch result {
                case let .success(user):
                    print(user)
                case let .failure(error):
                    print(error)
            }
        }
    }
}
