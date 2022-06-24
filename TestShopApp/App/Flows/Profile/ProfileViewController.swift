//
//  ProfileViewController.swift
//  TestShopApp
//
//  Created by Art on 12.06.2022.
//

import UIKit

final class ProfileViewController: UIViewController {
    
// MARK: - UI -
    private let changeDataView = ChangeUserDataView()
    
// MARK: - Properites -
    private let di: DI!
    var output: ProfileViewOutput!
    
// MARK: - Life cycle -
    init(di: DI){
        self.di = di
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        self.setupNavigationBar()
    }
    
// MARK: - SetViews -
    private func setViews() {
        self.view.backgroundColor = .white
        self.view.addSubview(changeDataView)
        
        changeDataView.delegate = self
        changeDataView.changeStateButton(isRegister: false)
        
        NSLayoutConstraint.activate([
            changeDataView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            changeDataView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            changeDataView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            changeDataView.bottomAnchor.constraint(greaterThanOrEqualTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10)])
    }
    
// MARK: - setupNavigationBar -
    private func setupNavigationBar() {
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"),
                                          style: .plain,
                                          target: self,
                                          action: #selector(rightNavButtonTapped))
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.title = "PROFILE"
    }
    
    @objc private func rightNavButtonTapped() {
        self.output.logout()
    }
}

extension ProfileViewController: ChangeUserDataViewOutput {
    var loginText: (String) -> Void {
        { self.output.loginChanged(text: $0) }
    }
    
    var passwordText: (String) -> Void {
        { self.output.passwordChanged(text: $0) }
    }
    
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
        self.output.changeUserData()
    }
}

// MARK: - ProfileViewInput -
extension ProfileViewController: ProfileViewInput {
    func showAuthVC() {
        let vc = di.authViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
