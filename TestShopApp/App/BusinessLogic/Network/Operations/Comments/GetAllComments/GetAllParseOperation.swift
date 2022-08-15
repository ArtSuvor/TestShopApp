//
//  GetAllParseOperation.swift
//  TestShopApp
//
//  Created by Art on 02.07.2022.
//

import Foundation

final class GetAllParseOperation: Operation {
    private let completion: (Result<[CommentModel], Error>) -> Void
    
// MARK: - Init -
    init(completion: @escaping (Result<[CommentModel], Error>) -> Void) {
        self.completion = completion
    }
    
// MARK: - Override -
    override func main() {
        guard let getAllOperation = dependencies.first as? GetAllRequestOperation else { return }
        
        if let data = getAllOperation.getData() {
            do {
                let response = try JSONDecoder().decode(CommentsResponse.self, from: data)
                completion(.success(response.result))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        } else if let error = getAllOperation.getError() {
            completion(.failure(error))
        }
    }
}
