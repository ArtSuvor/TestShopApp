//
//  AuthProtocols.swift
//  TestShopApp
//
//  Created Art on 11.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: Interactor
protocol AuthInteractorInput: AnyObject {
    func signIn(login: String, password: String)
    func signUp(request: RegisterRequest)
}

protocol AuthInteractorOutput: AnyObject {
}

// MARK: View Controller
protocol AuthViewInput: AnyObject {
    func changedStateView(isLoginView: Bool)
}

protocol AuthViewOutput: AnyObject {
    func signIn()
    func register()
    func changeStateView()
    func loginChanged(text: String)
    func passwordChanged(text: String)
    func emailChanged(text: String)
    func genderChanged(text: String)
    func cardChanged(text: String)
    func bioChanged(text: String)
}
