//
//  TestShopAppUITests.swift
//  TestShopAppUITests
//
//  Created by Art on 07.06.2022.
//

import XCTest

class TestShopAppUITests: XCTestCase {

    func testSignIn() throws {
        let app = XCUIApplication()
        app.launch()
        
        let loginView = app.otherElements["loginView"].firstMatch
        let loginTextField = loginView.textFields["loginTextField"].firstMatch
        let passwordTextField = loginView.secureTextFields["passwordTextField"].firstMatch
        let signInButton = loginView.buttons["signInButton"].firstMatch
        
        loginTextField.tap()
        loginTextField.typeText("admin")
        passwordTextField.tap()
        passwordTextField.typeText("admin")
        signInButton.tap()
        
        let secondView = app.otherElements["mainTabBarView"]
        XCTAssert(secondView.waitForExistence(timeout: 5))
    }

    func testSignUp() throws {
        let app = XCUIApplication()
        app.launch()
        
        let loginView = app.otherElements["loginView"].firstMatch
        let signUpButton = loginView.buttons["signUpButton"].firstMatch
        signUpButton.tap()
        
        let secondView = app.otherElements["registerView"]
        XCTAssert(secondView.exists)
    }
}
