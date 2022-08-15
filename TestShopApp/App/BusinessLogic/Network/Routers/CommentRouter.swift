//
//  CommentRouter.swift
//  TestShopApp
//
//  Created by Art on 02.07.2022.
//

import Foundation
import Alamofire

enum CommentRouter: URLRequestConvertible {
    case getAllComments(id: Int)
    case addComment(userId: Int, text: String)
    case deleteComment(id: Int)
    
    private var url: URL {
        URL(string: "https://testmockserver.herokuapp.com")!
    }
    
    private var method: HTTPMethod {
        switch self {
            case .getAllComments: return .get
            case .addComment,
                    .deleteComment:
                return .post
        }
    }
    
    private var path: String {
        switch self {
            case .getAllComments: return "/allComments"
            case .addComment: return "/addComment"
            case .deleteComment: return "/deleteComment"
        }
    }
    
    private var parameters: Parameters {
        switch self {
            case let .getAllComments(id): return ["productId": id]
            case let .addComment(userId, text): return ["userId": userId,
                                                        "commentText": text]
            case let .deleteComment(id): return ["commentId": id]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = url.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        return self.method == .get
        ? try URLEncoding.default.encode(request, with: parameters)
        : try JSONEncoding.default.encode(request, with: parameters)
    }
}
