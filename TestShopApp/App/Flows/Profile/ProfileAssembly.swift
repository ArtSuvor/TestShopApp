//
//  ProfileAssembly.swift
//  TestShopApp
//
//  Created Art on 12.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class ProfileAssembly {
    let view: ProfileViewController

    private init(view: ProfileViewController) {
        self.view = view
    }

    static func assemble(di: DI) -> ProfileAssembly {
        let view = ProfileViewController(di: di)
        let presenter = ProfilePresenter()
        let interactor = ProfileInteractor()

        view.output = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.output = presenter
        
        return ProfileAssembly(view: view)
    }
}
