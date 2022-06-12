//
//  ProfilePresenter.swift
//  TestShopApp
//
//  Created Art on 12.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class ProfilePresenter {
    weak var view: ProfileViewInput!
    var interactor: ProfileInteractorInput!

    init() { }
}

// MARK: - ProfileViewOutput
extension ProfilePresenter: ProfileViewOutput {
   
}

// MARK: - ProfileInteractorOutput
extension ProfilePresenter: ProfileInteractorOutput {
}
