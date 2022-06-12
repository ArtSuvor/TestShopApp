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
    }
    
}

// MARK: - ProfileViewInput -
extension ProfileViewController: ProfileViewInput {
    
}
