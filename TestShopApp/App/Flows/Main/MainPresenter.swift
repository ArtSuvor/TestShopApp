//
//  MainPresenter.swift
//  TestShopApp
//
//  Created Art on 25.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class MainPresenter {
    weak var view: MainViewInput!
    var interactor: MainInteractorInput!

    init() { }
}

// MARK: - MainViewOutput
extension MainPresenter: MainViewOutput {
    
}

// MARK: - MainInteractorOutput
extension MainPresenter: MainInteractorOutput {
}
