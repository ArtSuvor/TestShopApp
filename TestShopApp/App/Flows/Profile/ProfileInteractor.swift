//
//  ProfileInteractor.swift
//  TestShopApp
//
//  Created Art on 12.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class ProfileInteractor {
    weak var output: ProfileInteractorOutput!
    private let operation: AuthDataOperation!

    init(operation: AuthDataOperation) {
        self.operation = operation
    }
}

// MARK: - ProfileInteractorInput
extension ProfileInteractor: ProfileInteractorInput {
    func logout(userId: Int) {
        operation.logout(userId: userId) {[weak self] result in
            switch result {
                case .success:
                    self?.output.didLogout()
                case let .failure(error):
                    print(error.localizedDescription)
            }
        }
    }
}
