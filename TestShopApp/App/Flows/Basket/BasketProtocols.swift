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
}

protocol BasketInteractorOutput: AnyObject {
}

// MARK: - Router
protocol BasketRouterInput: AnyObject {
}

// MARK: View Controller
protocol BasketViewInput: AnyObject {
}

protocol BasketViewOutput: AnyObject {
    func viewIsReady()
}
