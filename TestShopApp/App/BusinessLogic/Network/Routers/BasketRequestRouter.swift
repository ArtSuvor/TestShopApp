//
//  BasketRequestRouter.swift
//  TestShopApp
//
//  Created by Art on 09.07.2022.
//

import Foundation
import Alamofire

enum BasketRequestRouter: URLRequestConvertible {
    case addProduct(id: Int)
    case deleteProduct(id: Int)
    case getAllProducts
    
    private var url: URL {
        URL(string: "https://testmockserver.herokuapp.com")!
    }
    
    private var method: HTTPMethod {
        switch self {
            case .getAllProducts: return .get
            default: return .post
        }
    }
    
    private var path: String {
        switch self {
            case .addProduct: return "/addProduct"
            case .deleteProduct: return "/deleteProduct"
            case .getAllProducts: return "/basketProduct"
        }
    }
    
    private var parameters: Parameters {
        switch self {
            case let .addProduct(id),
                    let .deleteProduct(id):
                return ["productId" : id]
            case .getAllProducts: return [:]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = url.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        return try method == .post
        ? JSONEncoding.default.encode(request, with: parameters)
        : URLEncoding.default.encode(request, with: parameters)
    }
}
