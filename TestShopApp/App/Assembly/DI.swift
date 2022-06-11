//
//  DI.swift
//  TestShopApp
//
//  Created by Art on 11.06.2022.
//

import UIKit

final class DI {
    var authViewController: UIViewController {
        makeViewController(flow: .auth)
    }
}

// MARK: - Private enum -
extension DI {
    private enum Flows {
        case auth
    }
}

// MARK: - Private methods -
extension DI {
    private func makeViewController(flow: Flows) -> UIViewController {
        switch flow {
            case .auth:
                let operation = makeAuthDataOperations()
                return AuthAssembly.assemble(operation: operation).view
        }
    }
    
    private func makeAuthDataOperations() -> AuthDataOperation {
        AuthDataOperationImpl()
    }
}