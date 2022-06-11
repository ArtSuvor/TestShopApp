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

    init() { }
}

// MARK: - AuthViewOutput
extension AuthPresenter: AuthViewOutput {
    
}

// MARK: - AuthInteractorOutput
extension AuthPresenter: AuthInteractorOutput {
}
