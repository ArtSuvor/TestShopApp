//
//  LoadProductParseOperation.swift
//  TestShopApp
//
//  Created by Art on 25.06.2022.
//

import Foundation

final class LoadProductParseOperation: Operation {
    private let completion: (Result<[ProductResponse], Error>) -> Void
    
// MARK: - Init -
    init(completion: @escaping (Result<[ProductResponse], Error>) -> Void) {
        self.completion = completion
    }
    
// MARK: - Override -
    override func main() {
        guard let loadOperation = dependencies.first as? LoadProductRequestsOperation else { return }
        if let data = loadOperation.getData() {
            do {
                let loadResult = try JSONDecoder().decode([ProductResponse].self, from: data)
                completion(.success(loadResult))
            } catch {
                completion(.failure(error))
            }
        } else if let error = loadOperation.getError() {
            completion(.failure(error))
        }
    }
}
