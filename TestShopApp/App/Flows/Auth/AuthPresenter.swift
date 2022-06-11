//
//  AuthPresenter.swift
//  TestShopApp
//
//  Created Art on 11.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class AuthPresenter {
    weak var view: AuthViewInput!
    var interactor: AuthInteractorInput!
    
    private var loginText: String?
    private var passwordText: String?

    init() { }
}

// MARK: - AuthViewOutput
extension AuthPresenter: AuthViewOutput {
    func signIn() {
        guard let login = self.loginText,
              let password = self.passwordText else { return }
        
        interactor.signIn(login: login, password: password)
    }
    
    func loginChanged(text: String) {
        self.loginText = text
    }
    
    func passwordChanged(text: String) {
        self.passwordText = text
    }
}

// MARK: - AuthInteractorOutput
extension AuthPresenter: AuthInteractorOutput {
}
