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
    
    private var isLoginView: Bool = true
    private var loginText: String?
    private var passwordText: String?
    private var emailText: String?
    private var genderText: String?
    private var cardText: String?
    private var bioText: String?
    
    init() { }
}

// MARK: - AuthViewOutput
extension AuthPresenter: AuthViewOutput {
    func signIn() {
        guard let login = self.loginText,
              let password = self.passwordText else { return }
        
        interactor.signIn(login: login, password: password)
    }
    
    func register() {
        guard let userName = self.loginText,
              let password = self.passwordText,
              let email = self.emailText,
              let gender = self.genderText,
              let card = self.cardText,
              let bio = self.bioText else { return }
        
        let registerRequest = RegisterRequest(userId: Int.random(in: 0...1000),
                                              userName: userName,
                                              password: password,
                                              email: email,
                                              gender: gender,
                                              creditCard: card,
                                              bio: bio)
        self.interactor.signUp(request: registerRequest)
    }
    
    func changeStateView() {
        self.isLoginView.toggle()
        self.view.changedStateView(isLoginView: isLoginView)
    }
    
    func loginChanged(text: String) {
        self.loginText = text
    }
    
    func passwordChanged(text: String) {
        self.passwordText = text
    }
    func emailChanged(text: String) {
        self.emailText = text
    }
    
    func genderChanged(text: String) {
        self.genderText = text
    }
    
    func cardChanged(text: String) {
        self.cardText = text
    }
    
    func bioChanged(text: String) {
        self.bioText = text
    }
}

// MARK: - AuthInteractorOutput
extension AuthPresenter: AuthInteractorOutput {
    func didRegister() {
        self.isLoginView.toggle()
        self.view.changedStateView(isLoginView: isLoginView)
    }
}
