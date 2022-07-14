//
//  BasketRouter.swift
//  TestShopApp
//
//  Created by Art on 09.07.2022.
//

import Foundation
import Alamofire

enum BasketRouter: URLRequestConvertible {
    case addProduct(id: Int)
    case deleteProduct(id: Int)
    
    private var url: URL {
        URL(string: "https://testmockserver.herokuapp.com")!
    }
    
    private var method: HTTPMethod {
        .post
    }
    
    private var path: String {
        switch self {
            case .addProduct: return "/addProduct"
            case .deleteProduct: return "/deleteProduct"
        }
    }
    
    private var parameters: Parameters {
        switch self {
            case let .addProduct(id),
                    let .deleteProduct(id):
                return ["productId" : id]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = url.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        return try JSONEncoding.default.encode(request, with: parameters)
    }
}
