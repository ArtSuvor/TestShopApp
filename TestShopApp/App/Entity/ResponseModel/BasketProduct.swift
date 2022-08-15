//
//  BasketProduct.swift
//  TestShopApp
//
//  Created by Art on 06.08.2022.
//

import Foundation

struct BasketProduct: Codable, Hashable {
    let id: Int
    let name: String
    let count: Int
}
