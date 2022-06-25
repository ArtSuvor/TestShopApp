//
//  ShopRouter.swift
//  TestShopApp
//
//  Created by Art on 25.06.2022.
//

import Foundation
import Alamofire

enum ShopRouter: URLRequestConvertible {
    case loadProducts(page: Int, catId: Int)
    case loadProductInfo(id: Int)
   
    
    private var url: URL {
        URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    }
    
    private var method: HTTPMethod {
        switch self {
            case .loadProducts,
                    .loadProductInfo: return .get
        }
    }
    
    private var path: String {
        switch self {
            case .loadProducts: return "catalogData.json"
            case .loadProductInfo: return "getGoodById.json"
        }
    }
    
    private var parameters: Parameters {
        switch self {
            case let .loadProducts(page, catId):
                return ["page_number" : page,
                        "id_category" : catId]
            case let .loadProductInfo(id):
                return ["id_product": "\(id)"]
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

