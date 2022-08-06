//
//  BasketPresenter.swift
//  TestShopApp
//
//  Created Art on 06.08.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class BasketPresenter {
    weak var view: BasketViewInput!
    var interactor: BasketInteractorInput!
    var router: BasketRouterInput!

    init() { }
}

// MARK: - BasketViewOutput
extension BasketPresenter: BasketViewOutput {
    func viewIsReady() {
    }
}

// MARK: - BasketInteractorOutput
extension BasketPresenter: BasketInteractorOutput {
}
