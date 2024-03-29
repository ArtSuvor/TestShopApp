//
//  LoginResult.swift
//  TestShopApp
//
//  Created by Art on 11.06.2022.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let user: User
}

struct User: Codable {
    let id: String
    let login: String
    let name: String
    let lastname: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastname = "user_lastname"
    }
}
