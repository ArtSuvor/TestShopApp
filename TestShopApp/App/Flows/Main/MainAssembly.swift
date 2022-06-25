//
//  MainAssembly.swift
//  TestShopApp
//
//  Created Art on 25.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MainAssembly {
    let view: MainViewController

    private init(view: MainViewController) {
        self.view = view
    }

    static func assemble() -> MainAssembly {
        let view = MainViewController()
        let presenter = MainPresenter()
        let interactor = MainInteractor()

        view.output = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.output = presenter

        return MainAssembly(view: view)
    }
}
