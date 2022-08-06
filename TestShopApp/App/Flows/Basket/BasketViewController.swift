//
//  BasketViewController.swift
//  TestShopApp
//
//  Created Art on 06.08.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class BasketViewController: UIViewController {
    
// MARK: - UI -
    private lazy var tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(BasketProductCell.self, forCellReuseIdentifier: BasketProductCell.reuseId)
        $0.separatorStyle = .none
        $0.separatorColor = .black
        $0.backgroundColor = .secondarySystemBackground
        return $0
    }(UITableView())
    
    private let orderButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Order", for: .normal)
        $0.backgroundColor = .systemOrange
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 10
        return $0
    }(UIButton())
    
// MARK: - Properties -
    private var dataSource: UITableViewDiffableDataSource<Int, BasketProduct>?
    private var products: [BasketProduct] = []
    var output: BasketViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        createDataSource()
        updateData()
        output.viewIsReady()
    }
    
    private func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, BasketProduct>()
        snapshot.appendSections([0])
        snapshot.appendItems(products, toSection: 0)
        self.dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    private func createDataSource() {
        self.dataSource = UITableViewDiffableDataSource(tableView: self.tableView) { tableView, indexPath, itemIdentifier in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BasketProductCell.reuseId,
                                                           for: indexPath) as? BasketProductCell else { return BasketProductCell() }
            cell.configure(with: itemIdentifier)
            return cell
        }
    }
}

// MARK: - BasketViewInput
extension BasketViewController: BasketViewInput {
    func didLoadBasketProducts(items: [BasketProduct]) {
        self.products = items
        self.updateData()
    }
}

extension BasketViewController {
    private func setupUI() {
        self.view.backgroundColor = .secondarySystemBackground
        self.view.addSubview(tableView)
        self.view.addSubview(orderButton)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        
            orderButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10),
            orderButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            orderButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            orderButton.widthAnchor.constraint(equalToConstant: 200),
            orderButton.heightAnchor.constraint(equalToConstant: 50)])
    }
}
