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
    
    func makeTabBarController() -> UITabBarController {
        TabBarController(mainVC: self.mainViewController,
                         profileVC: self.profileViewController)
    }
    
// MARK: - Private  -
    private var authDataOperations: AuthDataOperation {
        makeAuthDataOperations()
    }
    
    private var shopDataOperations: ShopDataOperations {
        makeShopDataOperations()
    }
    
    private var profileViewController: UIViewController {
        makeViewController(flow: .profile)
    }
    
    private var mainViewController: UIViewController {
        makeViewController(flow: .main)
    }
}

// MARK: - Private enum -
extension DI {
    private enum Flows {
        case auth
        case profile
        case main
    }
}

extension DI {
// MARK: - Make View Controllers -
    private func makeViewController(flow: Flows) -> UIViewController {
        switch flow {
            case .auth:
                return AuthAssembly.assemble(operation: self.authDataOperations, di: self).view
            case .profile:
                return ProfileAssembly.assemble(operation: self.authDataOperations,
                                                di: self).view
            case .main:
                return MainAssembly.assemble(operations: self.shopDataOperations).view
        }
    }
    
// MARK: - Make Operations -
    private func makeAuthDataOperations() -> AuthDataOperation {
        AuthDataOperationImpl()
    }
    
    private func makeShopDataOperations() -> ShopDataOperations {
        ShopDataOperationsImpl()
    }
}
