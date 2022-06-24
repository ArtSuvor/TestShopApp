//
//  ProfileProtocols.swift
//  TestShopApp
//
//  Created Art on 12.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: Interactor
protocol ProfileInteractorInput: AnyObject {
    func logout(userId: Int)
    func changeUserData(request: ChangeUserDataRequest)
}

protocol ProfileInteractorOutput: AnyObject {
    func didLogout()
    func didChangeUserData()
}

// MARK: View Controller
protocol ProfileViewInput: AnyObject {
    func showAuthVC()
}

protocol ProfileViewOutput: AnyObject {
    func logout()
    func changeUserData()
    func loginChanged(text: String)
    func passwordChanged(text: String)
    func emailChanged(text: String)
    func genderChanged(text: String)
    func cardChanged(text: String)
    func bioChanged(text: String)
}
