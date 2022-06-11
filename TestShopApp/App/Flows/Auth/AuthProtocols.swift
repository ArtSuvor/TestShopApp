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
}

protocol AuthInteractorOutput: AnyObject {
}

// MARK: View Controller
protocol AuthViewInput: AnyObject {
}

protocol AuthViewOutput: AnyObject {
    func signIn()
    func loginChanged(text: String)
    func passwordChanged(text: String)
}
