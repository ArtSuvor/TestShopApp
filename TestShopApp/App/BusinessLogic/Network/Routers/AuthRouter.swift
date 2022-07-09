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
    case register(request: RegisterRequest)
    case changeData(request: ChangeUserDataRequest)
    case logout(id: Int)
    
    private var url: URL {
        URL(string: "https://testmockserver.herokuapp.com")!
    }
    
    private var method: HTTPMethod {
        .post
    }
    
    private var path: String {
        switch self {
            case .login: return "/login"
            case .logout: return "/logout"
            case .register: return "/register"
            case .changeData: return "/changedata"
        }
    }
    
    private var parameters: Parameters {
        switch self {
            case let .login(login, password):
                return ["username" : login,
                        "password" : password]
            case let .logout(id):
                return ["id_user": "\(id)"]
            case let .register(request):
                return ["id_user": request.userId,
                        "username": request.userName,
                        "password": request.password,
                        "email": request.email,
                        "gender": request.gender,
                        "credit_card": request.creditCard,
                        "bio": request.bio]
            case let .changeData(request):
                return ["id_user": request.userId,
                        "username": request.userName,
                        "password": request.password,
                        "email": request.email,
                        "gender": request.gender,
                        "credit_card": request.creditCard,
                        "bio": request.bio]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = url.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        return try JSONEncoding.default.encode(request, with: parameters)
    }
}

