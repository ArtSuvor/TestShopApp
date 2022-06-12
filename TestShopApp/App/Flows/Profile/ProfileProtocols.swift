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
}

protocol ProfileInteractorOutput: AnyObject {
    func didLogout()
}

// MARK: View Controller
protocol ProfileViewInput: AnyObject {
    func showAuthVC()
}

protocol ProfileViewOutput: AnyObject {
    func logout()
}
