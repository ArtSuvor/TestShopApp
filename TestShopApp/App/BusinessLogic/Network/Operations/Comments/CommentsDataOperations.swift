//
//  CommentsDataOperations.swift
//  TestShopApp
//
//  Created by Art on 02.07.2022.
//

import Foundation

protocol CommentsDataOperations: AddingOperations, AnyObject {
    func getAllComments(productId: Int, completion: @escaping (Result<[CommentModel], Error>) -> Void)
    func addComment(userId: Int, text: String, completion: @escaping (Result<Void, Error>) -> Void)
    func deleteComment(commentId: Int, completion: @escaping (Result<Void, Error>) -> Void)
}

final class CommentsDataOperationsImpl: CommentsDataOperations {
    
// MARK: - getAllComments -
    func getAllComments(productId: Int, completion: @escaping (Result<[CommentModel], Error>) -> Void) {
        let request = GetAllRequestOperation(productId: productId)
        let parse = GetAllParseOperation { result in
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        self.addingOperations(request: request, parse: parse)
    }
    
// MARK: - addComment -
    func addComment(userId: Int, text: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let request = AddCommentRequestOperation(userId: userId, text: text)
        let parse = AddCommentParseOperation { result in
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        self.addingOperations(request: request, parse: parse)
    }
    
// MARK: - deleteComment -
    func deleteComment(commentId: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        let request = DeleteCommentRequestOperation(commentId: commentId)
        let parse = DeleteCommentParseOperation { result in
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        self.addingOperations(request: request, parse: parse)
    }
}
