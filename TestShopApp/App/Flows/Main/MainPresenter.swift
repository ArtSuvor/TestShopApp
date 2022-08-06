//
//  MainPresenter.swift
//  TestShopApp
//
//  Created Art on 25.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class MainPresenter {
    weak var view: MainViewInput!
    var interactor: MainInteractorInput!
    
    init() { }
}

// MARK: - MainViewOutput
extension MainPresenter: MainViewOutput {
    
    func loadComments(id: Int) {
        self.interactor.loadComments(id: id)
    }
    
    func loadProducts(page: Int, categoryId: Int) {
        self.interactor.loadProducts(page: page, categoryId: categoryId)
    }
    
    func loadDetailInfoProduct(id: Int) {
        self.interactor.loadDetailInfoProduct(id: id)
    }
}

// MARK: - MainInteractorOutput
extension MainPresenter: MainInteractorOutput {
    func didloadComments(items: [CommentModel]) {
        self.view.didloadComments(items: items)
    }
    
    func didLoadProducts(item: [ProductResponse]) {
        let products = item.map {
            ProductModel(id: $0.id,
                         name: $0.name,
                         price: $0.price,
                         description: nil)
        }
        self.view.didLoadProgucts(items: products)
    }
    
    func didLoadDetailInfoProduct(item: ProductModel) {
        self.view.didLoadDetailInfoProduct(item: item)
    }
}
