//
//  GetProductsParse.swift
//  TestShopApp
//
//  Created by Art on 06.08.2022.
//

import Foundation

final class GetProductsParseOperation: Operation {
    private let completion: (Result<[BasketProduct], Error>) -> Void
    
// MARK: - Init -
    init(completion: @escaping (Result<[BasketProduct], Error>) -> Void) {
        self.completion = completion
    }
    
// MARK: - Override -
    override func main() {
        guard let getProducts = dependencies.first as? GetProductsRequestOperation else { return }
        if let data = getProducts.getData() {
            do {
                let loadResult = try JSONDecoder().decode([BasketProduct].self, from: data)
                completion(.success(loadResult))
            } catch {
                completion(.failure(error))
            }
        } else if let error = getProducts.getError() {
            completion(.failure(error))
        }
    }
}
