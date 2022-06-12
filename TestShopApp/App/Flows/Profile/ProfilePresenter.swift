//
//  ProfilePresenter.swift
//  TestShopApp
//
//  Created Art on 12.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class ProfilePresenter {
    weak var view: ProfileViewInput!
    var interactor: ProfileInteractorInput!
    
    private var loginText: String?
    private var passwordText: String?
    private var emailText: String?
    private var genderText: String?
    private var cardText: String?
    private var bioText: String?

    init() { }
}

// MARK: - ProfileViewOutput
extension ProfilePresenter: ProfileViewOutput {
    func logout() {
        interactor.logout(userId: 123)
    }
    
    func changeUserData() {
        guard let userName = self.loginText,
              let password = self.passwordText,
              let email = self.emailText,
              let card = self.cardText,
              let bio = self.bioText else { return }
        
        let changeRequest = ChangeUserDataRequest(userId: Int.random(in: 0...1000),
                                                  userName: userName,
                                                  password: password,
                                                  email: email,
                                                  gender: genderText ?? "Male",
                                                  creditCard: card,
                                                  bio: bio)
        self.interactor.changeUserData(request: changeRequest)
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

// MARK: - ProfileInteractorOutput
extension ProfilePresenter: ProfileInteractorOutput {
    func didLogout() {
        self.view.showAuthVC()
    }
    
    func didChangeUserData() {
        //дергаем метод для получения актуальных данных пользователя
    }
}
