//
//  ShopDataOperations.swift
//  TestShopApp
//
//  Created by Art on 25.06.2022.
//

import Foundation

protocol ShopDataOperations {
    func loadProducts(page: Int, categoryId: Int, completion: @escaping (Result<[ProductResponse], Error>) -> Void)
    func loadDetailInfoProduct(id: Int, completion: @escaping (Result<ProductModel, Error>) -> Void)
}

final class ShopDataOperationsImpl: ShopDataOperations {
    private let operationQueue: OperationQueue
    
    init() {
        self.operationQueue = OperationQueue()
    }
    
// MARK: - loadProducts -
    func loadProducts(page: Int, categoryId: Int, completion: @escaping (Result<[ProductResponse], Error>) -> Void) {
        let request = LoadProductRequestsOperation(page: page, categoryId: categoryId)
        let parse = LoadProductParseOperation { result in
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        let operations = [request, parse]
        parse.addDependency(request)
        operationQueue.addOperations(operations, waitUntilFinished: false)
    }
    
    func loadDetailInfoProduct(id: Int, completion: @escaping (Result<ProductModel, Error>) -> Void) {
        let request = DetailInfoRequestOperation(productId: id)
        let parse = DetailInfoParseOperation { result in
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        let operations = [request, parse]
        parse.addDependency(request)
        operationQueue.addOperations(operations, waitUntilFinished: false)
    }
}
