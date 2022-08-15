//
//  AddProductParseOperation.swift
//  TestShopApp
//
//  Created by Art on 09.07.2022.
//

import Foundation

final class AddProductParseOperation: Operation {
    private let completion: (Result<AddProductResponse, Error>) -> Void
    
// MARK: - Init -
    init(completion: @escaping (Result<AddProductResponse, Error>) -> Void) {
        self.completion = completion
    }
    
// MARK: - Override -
    override func main() {
        guard let addOperation = dependencies.first as? AddProductRequestOperation else { return }
        if let data = addOperation.getData() {
            do {
                let loadResult = try JSONDecoder().decode(AddProductResponse.self, from: data)
                completion(.success(loadResult))
            } catch {
                completion(.failure(error))
            }
        } else if let error = addOperation.getError() {
            completion(.failure(error))
        }
    }
}
