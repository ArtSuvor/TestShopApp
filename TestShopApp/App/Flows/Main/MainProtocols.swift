//
//  MainProtocols.swift
//  TestShopApp
//
//  Created Art on 25.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: Interactor
protocol MainInteractorInput: AnyObject {
    func loadProducts(page: Int, categoryId: Int)
    func loadDetailInfoProduct(id: Int)
}

protocol MainInteractorOutput: AnyObject {
    func didLoadProducts(item: [ProductResponse])
    func didLoadDetailInfoProduct(item: ProductModel)
}

// MARK: View Controller
protocol MainViewInput: AnyObject {
    func didLoadProgucts(items: [ProductModel])
    func didLoadDetailInfoProduct(item: ProductModel)
}

protocol MainViewOutput: AnyObject {
    func loadProducts(page: Int, categoryId: Int)
    func loadDetailInfoProduct(id: Int)
}