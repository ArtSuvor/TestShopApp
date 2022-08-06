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
        TabBarController(mainVC: self.makeViewController(flow: .main),
                         profileVC: self.makeViewController(flow: .profile),
                         basketVC: self.makeViewController(flow: .basket))
    }
    
// MARK: - Private  -
    private var authDataOperations: AuthDataOperation {
        AuthDataOperationImpl()
    }
    
    private var shopDataOperations: ShopDataOperations {
        ShopDataOperationsImpl()
    }
    
    private var commentsOperations: CommentsDataOperations {
        CommentsDataOperationsImpl()
    }
}

// MARK: - Private enum -
extension DI {
    private enum Flows {
        case auth
        case profile
        case main
        case basket
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
                return MainAssembly.assemble(shopOperations: self.shopDataOperations,
                                             commentsOperations: self.commentsOperations).view
            case .basket:
                return BasketAssembly.assemble().view
        }
    }
}
