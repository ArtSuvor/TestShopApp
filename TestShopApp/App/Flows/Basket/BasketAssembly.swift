//
//  BasketAssembly.swift
//  TestShopApp
//
//  Created Art on 06.08.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class BasketAssembly {
    let view: BasketViewController

    private init(view: BasketViewController) {
        self.view = view
    }

    static func assemble(operations: BasketDataOperation) -> BasketAssembly {
        let view = BasketViewController()
        let presenter = BasketPresenter()
        let interactor = BasketInteractor(operations: operations)
        let router = BasketRouter()

        view.output = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        interactor.output = presenter
        router.view = view

        return BasketAssembly(view: view)
    }
}
