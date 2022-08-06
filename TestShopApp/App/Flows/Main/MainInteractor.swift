//
//  MainInteractor.swift
//  TestShopApp
//
//  Created Art on 25.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class MainInteractor {
    weak var output: MainInteractorOutput!
    private let shopOperations: ShopDataOperations
    private let commentsOperations: CommentsDataOperations

    init(shop: ShopDataOperations, comments: CommentsDataOperations) {
        self.shopOperations = shop
        self.commentsOperations = comments
    }
}

// MARK: - MainInteractorInput
extension MainInteractor: MainInteractorInput {
    func loadProducts(page: Int, categoryId: Int) {
        self.shopOperations.loadProducts(page: page, categoryId: categoryId) { result in
            switch result {
                case let .success(response):
                    self.output.didLoadProducts(item: response)
                case let .failure(error):
                    print(error)
            }
        }
    }
    
    func loadDetailInfoProduct(id: Int) {
        self.shopOperations.loadDetailInfoProduct(id: id) { result in
            switch result {
                case let .success(item):
                    self.output.didLoadDetailInfoProduct(item: item)
                case let .failure(error):
                    print(error)
            }
        }
    }
    
    func loadComments(id: Int) {
        self.commentsOperations.getAllComments(productId: id) { result in
            switch result {
                case let .success(items):
                    self.output.didloadComments(items: items)
                case let .failure(error):
                    print(error)
            }
        }
    }
}
