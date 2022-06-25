//
//  AuthRequestsTest.swift
//  TestShopAppTests
//
//  Created by Art on 07.06.2022.
//

import XCTest
@testable import TestShopApp

class AuthRequestsTest: XCTestCase {

    var operations: AuthDataOperation!
    
    override func setUpWithError() throws {
        self.operations = AuthDataOperationImpl()
    }

    override func tearDownWithError() throws {
        self.operations = nil
    }
    
    func testLoginRequest() {
        let userName = "Somebody"
        let password = "mypassword"
        var userResponse: User?
        let successResponse = User(id: 123,
                                   login: "geekbrains",
                                   name: "John",
                                   lastname: "Doe")
        
        let exp = expectation(description: #function)
        
         self.operations!.login(login: userName, password: password) { result in
            if let response = try? result.get() {
                userResponse = response
            }
             exp.fulfill()
        }
        waitForExpectations(timeout: 5)
        XCTAssert(userResponse?.id == successResponse.id, userResponse.debugDescription)
    }
    
    func testLogout() {
        let userId = 123
        var resultResponse = 0
        let exp = expectation(description: #function)
        
        self.operations.logout(userId: userId) { result in
            if let _ = try? result.get() {
                resultResponse = 1
            } else {
                resultResponse = 0
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 5)
        XCTAssert(resultResponse == 1, resultResponse.description)
    }
    
    func testRegister() {
        let user = RegisterRequest(userId: 1,
                                   userName: "",
                                   password: "",
                                   email: "",
                                   gender: "",
                                   creditCard: "",
                                   bio: "")
        var resultResponse = 0
        let exp = expectation(description: #function)
        
        self.operations.register(request: user) { result in
            if let _ = try? result.get() {
                resultResponse = 1
            } else {
                resultResponse = 0
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 5)
        XCTAssert(resultResponse == 1, resultResponse.description)
    }
    
    func testChangeUserData() {
        let user = ChangeUserDataRequest(userId: 123,
                                         userName: "",
                                         password: "",
                                         email: "",
                                         gender: "",
                                         creditCard: "",
                                         bio: "")
        var resultResponse = 0
        let exp = expectation(description: #function)
        
        self.operations.changeUserData(request: user) { result in
            if let _ = try? result.get() {
                resultResponse = 1
            } else {
                resultResponse = 0
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 5)
        XCTAssert(resultResponse == 1, resultResponse.description)
    }
}
