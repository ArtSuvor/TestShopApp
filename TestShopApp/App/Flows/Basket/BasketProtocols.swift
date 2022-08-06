//
//  BasketProtocols.swift
//  TestShopApp
//
//  Created Art on 06.08.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: Interactor
protocol BasketInteractorInput: AnyObject {
    func getBasketProducts()
}

protocol BasketInteractorOutput: AnyObject {
    func didLoadBasketProducts(items: [BasketProduct])
}

// MARK: - Router
protocol BasketRouterInput: AnyObject {
}

// MARK: View Controller
protocol BasketViewInput: AnyObject {
    func didLoadBasketProducts(items: [BasketProduct])
}

protocol BasketViewOutput: AnyObject {
    func viewIsReady()
}
