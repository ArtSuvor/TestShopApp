//
//  BasketDataOperation.swift
//  TestShopApp
//
//  Created by Art on 09.07.2022.
//

import Foundation

protocol BasketDataOperation: AddingOperations, AnyObject {
    func getAllBasketProducts(completion: @escaping (Result<[BasketProduct], Error>) -> Void)
    func addProduct(id: Int, completion: @escaping (Result<AddProductResponse, Error>) -> Void)
    func deleteProduct(id: Int, completion: @escaping (Result<DeleteProductResponse, Error>) -> Void)
}

final class BasketDataOperationImpl: BasketDataOperation {
    func getAllBasketProducts(completion: @escaping (Result<[BasketProduct], Error>) -> Void) {
        let request = GetProductsRequestOperation()
        let parse = GetProductsParseOperation { result in
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        self.addingOperations(request: request, parse: parse)
    }
    
// MARK: - addProduct -
    func addProduct(id: Int, completion: @escaping (Result<AddProductResponse, Error>) -> Void) {
        let request = AddProductRequestOperation(id: id)
        let parse = AddProductParseOperation { result in
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        self.addingOperations(request: request, parse: parse)
    }
    
// MARK: - deleteProduct -
    func deleteProduct(id: Int, completion: @escaping (Result<DeleteProductResponse, Error>) -> Void) {
        let request = DeleteProductRequestOperation(id: id)
        let parse = DeleteProductParseOperation { result in
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        self.addingOperations(request: request, parse: parse)
    }
}
