//
//  TabBarViewController.swift
//  TestShopApp
//
//  Created by Art on 25.06.2022.
//

import UIKit

class TabBarController: UITabBarController {
    private let mainVC: UIViewController!
    private let profileVC: UIViewController!
    private let basketVC: UIViewController!
    
    init(mainVC: UIViewController, profileVC: UIViewController, basketVC: UIViewController) {
        self.mainVC = mainVC
        self.profileVC = profileVC
        self.basketVC = basketVC
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .fullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewControllers = setViewControllers(first: self.mainVC,
                                             second: self.profileVC,
                                             third: self.basketVC)
        tabBar.tintColor = #colorLiteral(red: 0.5568627451, green: 0.3529411765, blue: 0.968627451, alpha: 1)
        tabBar.backgroundColor = .white
    }
    
    private func generateNavigationController(root: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: root)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
    
    private func setViewControllers(first: UIViewController, second: UIViewController, third: UIViewController) -> [UIViewController] {
        let boldConfiguration = UIImage.SymbolConfiguration(weight: .medium)
        let firstImage = UIImage(systemName: "shippingbox.fill",
                                 withConfiguration: boldConfiguration)
        let secondImage = UIImage(systemName: "person.fill",
                                  withConfiguration: boldConfiguration)
        let thirdImage = UIImage(systemName: "cart.fill",
                                 withConfiguration: boldConfiguration)
        let firstTitle = "Main"
        let secondTitle = "Profile"
        let thirdTitle = "Basket"
        let viewControllers = [generateNavigationController(root: first,
                                                            title: firstTitle,
                                                            image: firstImage!),
                               generateNavigationController(root: second,
                                                            title: secondTitle,
                                                            image: secondImage!),
                               generateNavigationController(root: third,
                                                            title: thirdTitle,
                                                            image: thirdImage!)]
        return viewControllers
    }
}
