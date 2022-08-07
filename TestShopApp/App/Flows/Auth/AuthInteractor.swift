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
    private let analyticsReporter: AnalyticReporter!

    init(operation: AuthDataOperation, analyticsReporter: AnalyticReporter) {
        self.operation = operation
        self.analyticsReporter = analyticsReporter
    }
}

// MARK: - AuthInteractorInput
extension AuthInteractor: AuthInteractorInput {
    func signIn(login: String, password: String) {
        operation.login(login: login, password: password) {[weak self] result in
            switch result {
                case let .success(user):
                    self?.output.didLogin()
                    self?.analyticsReporter.reportEvent(.signIn(user.name))
                case let .failure(error):
                    self?.analyticsReporter.reportEvent(.error(error.localizedDescription))
            }
        }
    }
    
    func signUp(request: RegisterRequest) {
        operation.register(request: request) {[weak self] result in
            switch result {
                case .success:
                    self?.output.didRegister()
                    self?.analyticsReporter.reportEvent(.signUp(request.userName))
                case let .failure(error):
                    self?.analyticsReporter.reportEvent(.error(error.localizedDescription))
            }
        }
    }
}
