//
//  ProductResponse.swift
//  TestShopApp
//
//  Created by Art on 25.06.2022.
//

import Foundation

struct ProductResponse: Codable, Equatable {
    let id: Int
    let name: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price
    }
}

struct ProductModel: Codable, Equatable {
    let id: Int?
    let name: String
    let price: Int
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price = "product_price"
        case description = "product_description"
    }
}
