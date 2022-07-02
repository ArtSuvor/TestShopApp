//
//  CommentsRequestsTest.swift
//  TestShopAppTests
//
//  Created by Art on 02.07.2022.
//

import XCTest
@testable import TestShopApp

class CommentsRequestsTest: XCTestCase {

    private var operations: CommentsDataOperations?
    
    override func setUpWithError() throws {
        self.operations = CommentsDataOperationsImpl()
    }

    override func tearDownWithError() throws {
        self.operations = nil
    }
    
    func testGetAllComments() {
        let productId = 1
        var response = [CommentModel]()
        let exp = expectation(description: #function)
        
        self.operations?.getAllComments(productId: productId) { result in
            if let data = try? result.get() {
                response = data
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 5)
        XCTAssert(response.contains(where: { $0.commentId == 1231}))
    }
    
    func testAddComment() {
        let userId = 234
        let commentText = "adsfgkabdfjghaudhfguiadfgadf"
        var response = 0
        let exp = expectation(description: #function)
        
        self.operations?.addComment(userId: userId, text: commentText) { result in
            if let _ = try? result.get() {
                response = 1
            } else {
                response = 0
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 5)
        XCTAssert(response == 1)
    }
    
    func testDeleteComment() {
        let commentId = 123
        var response = 0
        let exp = expectation(description: #function)
        
        self.operations?.deleteComment(commentId: commentId) { result in
            if let _ = try? result.get() {
                response = 1
            } else {
                response = 0
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 5)
        XCTAssert(response == 1)
    }
}
