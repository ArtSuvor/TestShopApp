//
//  AuthAssembly.swift
//  TestShopApp
//
//  Created Art on 11.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class AuthAssembly {
    let view: AuthViewController

    private init(view: AuthViewController) {
        self.view = view
    }

    static func assemble() -> AuthAssembly {
        let view = AuthViewController()
        let presenter = AuthPresenter()
        let interactor = AuthInteractor()
        
        view.output = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.output = presenter
        
        return AuthAssembly(view: view)
    }
}
