//
//  LoginView.swift
//  TestShopApp
//
//  Created by Art on 11.06.2022.
//

import UIKit

protocol LoginViewOutput: AnyObject {
    var loginText: (String) -> Void { get }
    var passwordText: (String) -> Void { get }
}

final class LoginView: UIView {
    
// MARK: - UI -
    private let backView: UIView = {
        let v = UIView()
        v.layer.masksToBounds = true
        v.layer.cornerRadius = 20
        v.backgroundColor = .white
        return v
    }()
    
    private let loginTitleLabel: UILabel = {
        let l = UILabel()
        l.text = "Логин"
        l.font = UIFont.systemFont(ofSize: 20)
        l.textAlignment = .center
        l.textColor = .gray
        return l
    }()
    
    private let loginTextField: UITextField = {
        let t = UITextField()
        t.placeholder = "Введите ваш логин"
        t.textColor = .black
        t.borderStyle = .roundedRect
        t.font = UIFont.systemFont(ofSize: 15)
        return t
    }()
    
    private let passwordTitleLabel: UILabel = {
        let l = UILabel()
        l.text = "Пароль"
        l.font = UIFont.systemFont(ofSize: 20)
        l.textAlignment = .center
        l.textColor = .gray
        return l
    }()
    
    private let passwordTextField: UITextField = {
        let t = UITextField()
        t.placeholder = "Введите ваш пароль"
        t.textColor = .black
        t.borderStyle = .roundedRect
        t.font = UIFont.systemFont(ofSize: 15)
        return t
    }()
    
    private let signInButton: UIButton = {
        let b = UIButton()
        b.setTitle("Вход", for: .normal)
        b.tintColor = .black
        b.setTitleColor(UIColor.black, for: .normal)
        b.backgroundColor = .lightGray
        b.layer.masksToBounds = true
        b.layer.cornerRadius = 15
        return b
    }()
    
    private let signUpButton: UIButton = {
        let b = UIButton()
        b.setTitle("Регистрация", for: .normal)
        b.setTitleColor(UIColor.black, for: .normal)
        b.tintColor = .black
        b.backgroundColor = .lightGray
        b.layer.masksToBounds = true
        b.layer.cornerRadius = 15
        return b
    }()
    
// MARK: - Delegate -
    weak var delegate: LoginViewOutput?
    
// MARK: - Init -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
// MARK: - Set Views -
    private func setViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        backView.translatesAutoresizingMaskIntoConstraints = false
        loginTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.setupShadow()
        self.setDelegate()
        self.addingSubviews(backView: backView, views: [loginTitleLabel, loginTextField, passwordTitleLabel, passwordTextField, signInButton, signUpButton])
    }
    
    private func addingSubviews(backView: UIView, views: [UIView]) {
        self.addSubview(backView)
        views.forEach { backView.addSubview($0) }
    }
    
    private func setupShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize.zero
    }
    
    private func setDelegate() {
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
}

// MARK: - UITextFieldDelegate -
extension LoginView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            self.sendUpdateText(textField: textField, text: updatedText)
        }
        return true
    }
    
    private func sendUpdateText(textField: UITextField, text: String) {
        switch textField {
            case loginTextField:
                self.delegate?.loginText(text)
            case passwordTextField:
                self.delegate?.passwordText(text)
            default: break
        }
    }
}

// MARK: - Constraints -
extension LoginView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: self.topAnchor),
            backView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            loginTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            loginTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            loginTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            loginTextField.topAnchor.constraint(equalTo: loginTitleLabel.bottomAnchor, constant: 5),
            loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        
            passwordTitleLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            passwordTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            passwordTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        
            passwordTextField.topAnchor.constraint(equalTo: passwordTitleLabel.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            signInButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            signInButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
        
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 10),
            signUpButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            signUpButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            signUpButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)])
    }
}
