//
//  ShopRequestTest.swift
//  TestShopAppTests
//
//  Created by Art on 25.06.2022.
//

import XCTest
@testable import TestShopApp

class ShopRequestTest: XCTestCase {
    var operations: ShopDataOperations!
    
    override func setUpWithError() throws {
        self.operations = ShopDataOperationsImpl()
    }

    override func tearDownWithError() throws {
        self.operations = nil
    }
    
    func testLoadAllProducts() {
        let page = 1
        let category = 1
        var products = [ProductResponse]()
        let resultResponse = [ProductResponse(id: 123,
                                              name: "Ноутбук",
                                              price: 45600),
                              ProductResponse(id: 456,
                                              name: "Мышка",
                                              price: 1000)]
        let exp = expectation(description: #function)
        
        self.operations.loadProducts(page: page, categoryId: category) { result in
            if let data = try? result.get() {
                products = data
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 5)
        XCTAssert(products == resultResponse, products.debugDescription)
    }
    
    func testLoadDetailInfo() {
        let id = 123
        var product: ProductModel?
        let resultResponse = ProductModel(id: nil,
                                          name: "Ноутбук",
                                          price: 45600,
                                          description: "Мощный игровой ноутбук")
        let exp = expectation(description: #function)
        
        self.operations.loadDetailInfoProduct(id: id) { result in
            if let data = try? result.get() {
                product = data
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 5)
        XCTAssert(product! == resultResponse, product.debugDescription)
    }
}
