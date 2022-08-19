//
//  SceneDelegate.swift
//  TestShopApp
//
//  Created by Art on 07.06.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let di = DI()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let root = di.authViewController
        
        window.rootViewController = root
        window.makeKeyAndVisible()
        self.window = window
    }
}

