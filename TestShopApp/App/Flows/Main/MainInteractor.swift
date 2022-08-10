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
    private let analyticsReporter: AnalyticReporter

    init(shop: ShopDataOperations, comments: CommentsDataOperations, analyticsReporter: AnalyticReporter) {
        self.shopOperations = shop
        self.commentsOperations = comments
        self.analyticsReporter = analyticsReporter
    }
}

// MARK: - MainInteractorInput
extension MainInteractor: MainInteractorInput {
    func loadProducts(page: Int, categoryId: Int) {
        self.shopOperations.loadProducts(page: page, categoryId: categoryId) {[weak self] result in
            switch result {
                case let .success(response):
                    self?.output.didLoadProducts(item: response)
                case let .failure(error):
                    self?.analyticsReporter.reportEvent(.error(error.localizedDescription))
            }
        }
    }
    
    func loadDetailInfoProduct(id: Int) {
        self.shopOperations.loadDetailInfoProduct(id: id) {[weak self] result in
            switch result {
                case let .success(item):
                    self?.output.didLoadDetailInfoProduct(item: item)
                case let .failure(error):
                    self?.analyticsReporter.reportEvent(.error(error.localizedDescription))
            }
        }
    }
    
    func loadComments(id: Int) {
        self.commentsOperations.getAllComments(productId: id) {[weak self] result in
            switch result {
                case let .success(items):
                    self?.output.didloadComments(items: items)
                case let .failure(error):
                    self?.analyticsReporter.reportEvent(.error(error.localizedDescription))
            }
        }
    }
    
    func reportEvent(_ event: AnalyticEvents) {
        self.analyticsReporter.reportEvent(event)
    }
}
