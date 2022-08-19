//
//  RegisterView.swift
//  TestShopApp
//
//  Created by Art on 12.06.2022.
//

import UIKit

protocol ChangeUserDataViewOutput: AnyObject {
    var loginText: (String) -> Void { get }
    var passwordText: (String) -> Void { get }
    var emailText: (String) -> Void { get }
    var genderText: (String) -> Void { get }
    var cardText: (String) -> Void { get }
    var bioText: (String) -> Void { get }
    
    func buttonTapped()
}

final class ChangeUserDataView: UIView {
    private enum Gender: Int {
        case male
        case female
        
        var description: String {
            switch self {
                case .male: return "Male"
                case .female: return "Female"
            }
        }
    }
    
// MARK: - UI -
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
    
    private let emailLabel: UILabel = {
        let l = UILabel()
        l.text = "Email"
        l.font = UIFont.systemFont(ofSize: 20)
        l.textAlignment = .center
        l.textColor = .gray
        return l
    }()
    
    private let emailTextField: UITextField = {
        let t = UITextField()
        t.placeholder = "Введите ваш Email"
        t.textColor = .black
        t.borderStyle = .roundedRect
        t.font = UIFont.systemFont(ofSize: 15)
        return t
    }()
    
    private let cardLabel: UILabel = {
        let l = UILabel()
        l.text = "Card"
        l.font = UIFont.systemFont(ofSize: 20)
        l.textAlignment = .center
        l.textColor = .gray
        return l
    }()
    
    private let cardTextField: UITextField = {
        let t = UITextField()
        t.placeholder = "Enter your credit card"
        t.textColor = .black
        t.borderStyle = .roundedRect
        t.font = UIFont.systemFont(ofSize: 15)
        return t
    }()
    
    private let genderLabel: UILabel = {
        let l = UILabel()
        l.text = "Gender"
        l.font = UIFont.systemFont(ofSize: 20)
        l.textAlignment = .center
        l.textColor = .gray
        return l
    }()
    
    private let genderSegmented: UISegmentedControl = {
        let s = UISegmentedControl(items: [Gender.male.description,
                                           Gender.female.description])
        s.selectedSegmentIndex = 0
        s.tintColor = .black
        return s
    }()
    
    private let bioLabel: UILabel = {
        let l = UILabel()
        l.text = "Bio"
        l.font = UIFont.systemFont(ofSize: 20)
        l.textAlignment = .center
        l.textColor = .gray
        return l
    }()
    
    private let bioTextView: UITextView = {
        let t = UITextView()
        t.font = UIFont.systemFont(ofSize: 15)
        t.textColor = .black
        t.layer.borderColor = UIColor.gray.cgColor
        t.layer.borderWidth = 1
        t.layer.masksToBounds = true
        t.layer.cornerRadius = 5
        t.translatesAutoresizingMaskIntoConstraints = false
        t.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return t
    }()
    
    private let registrationButton: UIButton = {
        let b = UIButton()
        b.tintColor = .black
        b.setTitleColor(UIColor.black, for: .normal)
        b.backgroundColor = .lightGray
        b.layer.masksToBounds = true
        b.layer.cornerRadius = 15
        return b
    }()
    
// MARK: - Properties -
    weak var delegate: ChangeUserDataViewOutput?
    private var isRegister: Bool = true
    
// MARK: - Init -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
// MARK: - Public Method -
    func changeStateButton(isRegister: Bool) {
        self.isRegister = isRegister
        registrationButton.setTitle(isRegister ? "Register" : "Change", for: .normal)
    }
    
// MARK: - Set Views -
    private func setViews() {
        let loginStack = createStackView(titleView: loginTitleLabel, textView: loginTextField)
        let passwordStack = createStackView(titleView: passwordTitleLabel, textView: passwordTextField)
        let emailStack = createStackView(titleView: emailLabel, textView: emailTextField)
        let genderStack = createStackView(titleView: genderLabel, textView: genderSegmented)
        let cardStack = createStackView(titleView: cardLabel, textView: cardTextField)
        let bioStack = createStackView(titleView: bioLabel, textView: bioTextView)
        let generalStack = createGeneralStack(views: [loginStack,
                                                      passwordStack,
                                                      emailStack,
                                                      genderStack,
                                                      cardStack,
                                                      bioStack])
        
        generalStack.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.registrationButton.translatesAutoresizingMaskIntoConstraints = false
        self.accessibilityIdentifier = self.isRegister ? "registerView" : "changeDataView"
        self.addSubview(generalStack)
        self.addSubview(registrationButton)
        self.setConstraints(generalStack: generalStack)
        self.setDelegate()
    }
    
// MARK: - Create StackView -
    private func createStackView<T: UIView, U: UIView>(titleView: T, textView: U) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: [titleView, textView])
        stack.alignment = .fill
        stack.axis = .vertical
        stack.spacing = 5
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor.gray.cgColor
        stack.layer.masksToBounds = true
        stack.layer.cornerRadius = 10
        stack.distribution = .fillProportionally
        return stack
    }
    
    private func createGeneralStack(views: [UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: views)
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        return stack
    }
    
// MARK: - Delegate/Targets -
    private func setDelegate() {
        loginTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.delegate = self
        cardTextField.delegate = self
        bioTextView.delegate = self
        
        genderSegmented.addTarget(self, action: #selector(changedSegmented), for: .valueChanged)
        registrationButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    @objc private func changedSegmented() {
        guard let gender = Gender(rawValue: genderSegmented.selectedSegmentIndex) else { return }
        self.delegate?.genderText(gender.description)
    }
    
    @objc private func registerButtonTapped() {
        self.delegate?.buttonTapped()
    }
}

// MARK: - UITextFieldDelegate -
extension ChangeUserDataView: UITextFieldDelegate {
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
            case emailTextField:
                self.delegate?.emailText(text)
            case cardTextField:
                self.delegate?.cardText(text)
            default: break
        }
    }
}

// MARK: - UITextViewDelegate -
extension ChangeUserDataView: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if let text = textView.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: text)
            self.delegate?.bioText(updatedText)
        }
        return true
    }
}

// MARK: - Constraints -
extension ChangeUserDataView {
    private func setConstraints(generalStack: UIStackView) {
        NSLayoutConstraint.activate([
            generalStack.topAnchor.constraint(equalTo: self.topAnchor),
            generalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            generalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        
            registrationButton.topAnchor.constraint(equalTo: generalStack.bottomAnchor, constant: 20),
            registrationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            registrationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            registrationButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            registrationButton.heightAnchor.constraint(equalToConstant: 50)])
    }
}
