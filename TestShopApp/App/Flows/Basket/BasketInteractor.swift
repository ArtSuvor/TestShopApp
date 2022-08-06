//
//  BasketInteractor.swift
//  TestShopApp
//
//  Created Art on 06.08.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class BasketInteractor {
    weak var output: BasketInteractorOutput!
    private let operations: BasketDataOperation

    init(operations: BasketDataOperation) {
        self.operations = operations
    }
}

// MARK: - BasketInteractorInput
extension BasketInteractor: BasketInteractorInput {
    func getBasketProducts() {
        self.operations.getAllBasketProducts { result in
            switch result {
                case let .success(items):
                    self.output.didLoadBasketProducts(items: items)
                case let .failure(error):
                    print(error)
            }
        }
    }
}
