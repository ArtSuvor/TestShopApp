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
    private let analyticsReporter: AnalyticReporter

    init(operation: AuthDataOperation, analyticsReporter: AnalyticReporter) {
        self.operation = operation
        self.analyticsReporter = analyticsReporter
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
                    self?.analyticsReporter.reportEvent(.error(error.localizedDescription))
            }
        }
    }
    
    func changeUserData(request: ChangeUserDataRequest) {
        operation.changeUserData(request: request) {[weak self] result in
            switch result {
                case .success:
                    self?.output.didChangeUserData()
                case let .failure(error):
                    self?.analyticsReporter.reportEvent(.error(error.localizedDescription))
            }
        }
    }
    
    func reportEvent(_ event: AnalyticEvents) {
        self.analyticsReporter.reportEvent(event)
    }
}
