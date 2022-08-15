//
//  DeleteProductParseOperation.swift
//  TestShopApp
//
//  Created by Art on 09.07.2022.
//

import Foundation

final class DeleteProductParseOperation: Operation {
    private let completion: (Result<DeleteProductResponse, Error>) -> Void
    
// MARK: - Init -
    init(completion: @escaping (Result<DeleteProductResponse, Error>) -> Void) {
        self.completion = completion
    }
    
// MARK: - Override -
    override func main() {
        guard let deleteOeration = dependencies.first as? DeleteProductRequestOperation else { return }
        if let data = deleteOeration.getData() {
            do {
                let loadResult = try JSONDecoder().decode(DeleteProductResponse.self, from: data)
                completion(.success(loadResult))
            } catch {
                completion(.failure(error))
            }
        } else if let error = deleteOeration.getError() {
            completion(.failure(error))
        }
    }
}
