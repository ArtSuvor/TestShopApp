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
    
// MARK: - Properties -
    var output: AuthViewOutput!
    
// MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
// MARK: - Set Views -
    private func setViews() {
        self.view.backgroundColor = .white
        self.view.addSubview(loginView)
        loginView.delegate = self
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            loginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)])
    }
}

// MARK: - LoginViewOutput -
extension AuthViewController: LoginViewOutput {
    var loginText: (String) -> Void {
        { print($0) }
    }
    
    var passwordText: (String) -> Void {
        { print($0) }
    }
}

extension AuthViewController: AuthViewInput {
    
}
