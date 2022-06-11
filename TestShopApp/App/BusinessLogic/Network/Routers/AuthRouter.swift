//
//  AuthRouter.swift
//  TestShopApp
//
//  Created by Art on 11.06.2022.
//

import Foundation
import Alamofire

enum AuthRouter: URLRequestConvertible {
    case login(log: String, pass: String)
    case logout(id: Int)
    
    private var url: URL {
        URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    }
    
    private var method: HTTPMethod {
        switch self {
            case .login,
                    .logout: return .get
        }
    }
    
    private var path: String {
        switch self {
            case .login: return "login.json"
            case .logout: return "logout.json"
        }
    }
    
    private var parameters: Parameters {
        switch self {
            case let .login(login, password):
                return ["username" : login,
                        "password" : password]
            case let .logout(id):
                return ["id_user": "\(id)"]
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
