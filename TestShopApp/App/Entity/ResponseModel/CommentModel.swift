//
//  CommentResponse.swift
//  TestShopApp
//
//  Created by Art on 02.07.2022.
//

import Foundation

struct CommentsResponse: Codable {
    let result: [CommentModel]
}

struct CommentModel: Codable {
    let userId: Int
    let commentId: Int
    let commentText: String
}
