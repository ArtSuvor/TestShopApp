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
    
    var profileViewController: UIViewController {
        makeViewController(flow: .profile)
    }
    
    var authDataOperations: AuthDataOperation {
        makeAuthDataOperations()
    }
}

// MARK: - Private enum -
extension DI {
    private enum Flows {
        case auth
        case profile
    }
}

extension DI {
// MARK: - Make View Controllers -
    private func makeViewController(flow: Flows) -> UIViewController {
        switch flow {
            case .auth:
                return AuthAssembly.assemble(operation: self.authDataOperations, di: self).view
            case .profile:
                let vc = ProfileAssembly.assemble(operation: self.authDataOperations, di: self).view
                return UINavigationController(rootViewController: vc)
        }
    }
    
// MARK: - Make Operations -
    private func makeAuthDataOperations() -> AuthDataOperation {
        AuthDataOperationImpl()
    }
}
