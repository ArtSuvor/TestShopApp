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
    private let registerView: ChangeUserDataView = ChangeUserDataView()
    
// MARK: - Properties -
    private let di: DI!
    var output: AuthViewOutput!
    
// MARK: - Life cycle -
    init(di: DI) {
        self.di = di
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        registerView.changeStateButton(isRegister: true)
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
extension AuthViewController: ChangeUserDataViewOutput {
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
    
    func buttonTapped() {
        self.output.register()
    }
}

// MARK: - AuthViewInput -
extension AuthViewController: AuthViewInput {
    func showProfileView() {
        let vc = di.profileViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func changedStateView(isLoginView: Bool) {
        UIView.transition(with: self.view, duration: 0.5, options: [.transitionCrossDissolve]) {[weak self] in
            self?.loginView.isHidden = !isLoginView
            self?.registerView.isHidden = isLoginView
        }
    }
}
