//
//  DetailInfoParseOperation.swift
//  TestShopApp
//
//  Created by Art on 25.06.2022.
//

import Foundation

final class DetailInfoParseOperation: Operation {
    private let completion: (Result<ProductModel, Error>) -> Void
    
// MARK: - Init -
    init(completion: @escaping (Result<ProductModel, Error>) -> Void) {
        self.completion = completion
    }
    
// MARK: - Override -
    override func main() {
        guard let loadOperation = dependencies.first as? DetailInfoRequestOperation else { return }
        if let data = loadOperation.getData() {
            do {
                let loadResult = try JSONDecoder().decode(ProductModel.self, from: data)
                completion(.success(loadResult))
            } catch {
                completion(.failure(error))
            }
        } else if let error = loadOperation.getError() {
            completion(.failure(error))
        }
    }
}
