//
//  ProfileViewController.swift
//  TestShopApp
//
//  Created by Art on 12.06.2022.
//

import UIKit

final class ProfileViewController: UIViewController {
    
// MARK: - Properites -
    private let di: DI!
    var output: ProfileViewOutput!
    
// MARK: - Life cycle -
    init(di: DI){
        self.di = di
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        self.setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"),
                                          style: .plain,
                                          target: self,
                                          action: #selector(rightNavButtonTapped))
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.title = "PROFILE"
    }
    
    @objc private func rightNavButtonTapped() {
        self.output.logout()
    }
}

// MARK: - ProfileViewInput -
extension ProfileViewController: ProfileViewInput {
    func showAuthVC() {
        let vc = di.authViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
