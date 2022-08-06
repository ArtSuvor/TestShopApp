//
//  BasketViewController.swift
//  TestShopApp
//
//  Created Art on 06.08.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class BasketViewController: UIViewController {
    var output: BasketViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
    }
}

// MARK: - BasketViewInput
extension BasketViewController: BasketViewInput {
}
