//
//  ShopDataOperations.swift
//  TestShopApp
//
//  Created by Art on 25.06.2022.
//

import Foundation

protocol ShopDataOperations: AddingOperations, AnyObject {
    func loadProducts(page: Int, categoryId: Int, completion: @escaping (Result<[ProductResponse], Error>) -> Void)
    func loadDetailInfoProduct(id: Int, completion: @escaping (Result<ProductModel, Error>) -> Void)
}

final class ShopDataOperationsImpl: ShopDataOperations {
    
// MARK: - loadProducts -
    func loadProducts(page: Int, categoryId: Int, completion: @escaping (Result<[ProductResponse], Error>) -> Void) {
        let request = LoadProductRequestsOperation(page: page, categoryId: categoryId)
        let parse = LoadProductParseOperation { result in
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        self.addingOperations(request: request, parse: parse)
    }
    
    func loadDetailInfoProduct(id: Int, completion: @escaping (Result<ProductModel, Error>) -> Void) {
        let request = DetailInfoRequestOperation(productId: id)
        let parse = DetailInfoParseOperation { result in
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        self.addingOperations(request: request, parse: parse)
    }
}
