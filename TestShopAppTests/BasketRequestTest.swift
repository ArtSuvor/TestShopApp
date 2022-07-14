//
//  BasketRequestTest.swift
//  TestShopAppTests
//
//  Created by Art on 09.07.2022.
//

import XCTest
@testable import TestShopApp

class BasketRequestTest: XCTestCase {
    private var operations: BasketDataOperation?
    
    override func setUpWithError() throws {
        self.operations = BasketDataOperationImpl()
    }

    override func tearDownWithError() throws {
        self.operations = nil
    }
    
    func testAddProduct() {
        let productId = 1
        var response: AddProductResponse?
        let exp = expectation(description: #function)
        
        self.operations?.addProduct(id: productId) { result in
            if let data = try? result.get() {
                response = data
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 5)
        XCTAssert(response?.result == 1)
    }
    
    func testDeleteProduct() {
        let productId = 1
        var response: DeleteProductResponse?
        let exp = expectation(description: #function)
        
        self.operations?.deleteProduct(id: productId) { result in
            if let data = try? result.get() {
                response = data
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 5)
        XCTAssert(response?.result == 1)
    }
}
