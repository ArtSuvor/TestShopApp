//
//  ProductResponse.swift
//  TestShopApp
//
//  Created by Art on 25.06.2022.
//

import Foundation

struct ProductResponse: Codable {
    let page: Int
    let products: [ProductModel]
    
    enum CodingKeys: String, CodingKey {
        case page = "page_number"
        case products
    }
}

struct ProductModel: Codable {
    let id: Int
    let name: String
    let price: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price
    }
}
