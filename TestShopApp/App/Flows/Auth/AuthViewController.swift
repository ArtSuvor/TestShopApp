//
//  AuthViewController.swift
//  TestShopApp
//
//  Created by Art on 07.06.2022.
//

import UIKit

class AuthViewController: UIViewController {
    
// MARK: - UI -
    private let loginView: LoginView = LoginView()
    private let registerView: RegisterView = RegisterView()
    
// MARK: - Properties -
    var output: AuthViewOutput!
    
// MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setLoginViews()
    }
    
// MARK: - Set Views -
    private func setLoginViews() {
        self.view.backgroundColor = .white
        self.view.addSubview(loginView)
        self.view.addSubview(registerView)
        
        loginView.delegate = self
        registerView.delegate = self
        
        loginView.isHidden = false
        registerView.isHidden = true
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            loginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)])
        
        NSLayoutConstraint.activate([
            registerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            registerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            registerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)])
    }
}

// MARK: - LoginViewOutput -
extension AuthViewController: LoginViewOutput {
    var loginText: (String) -> Void {
        { self.output.loginChanged(text: $0) }
    }
    
    var passwordText: (String) -> Void {
        { self.output.passwordChanged(text: $0) }
    }
    
    func signInTapped() {
        self.output.signIn()
    }
    
    func signUpTapped() {
        self.output.changeStateView()
    }
}

// MARK: - RegisterViewOutput -
extension AuthViewController: RegisterViewOutput {
    var emailText: (String) -> Void {
        { self.output.emailChanged(text: $0) }
    }
    
    var genderText: (String) -> Void {
        { self.output.genderChanged(text: $0) }
    }
    
    var cardText: (String) -> Void {
        { self.output.cardChanged(text: $0) }
    }
    
    var bioText: (String) -> Void {
        { self.output.bioChanged(text: $0) }
    }
    
    func registerTapped() {
        self.output.register()
    }
}

// MARK: - AuthViewInput -
extension AuthViewController: AuthViewInput {
    func changedStateView(isLoginView: Bool) {
        UIView.transition(with: self.view, duration: 0.5, options: [.transitionCrossDissolve]) {[weak self] in
            self?.loginView.isHidden = !isLoginView
            self?.registerView.isHidden = isLoginView
        }
    }
}
