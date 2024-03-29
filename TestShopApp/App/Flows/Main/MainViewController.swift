//
//  MainViewController.swift
//  TestShopApp
//
//  Created Art on 25.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    
// MARK: - UI -
    private lazy var tableView: UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.separatorStyle = .none
        t.register(MainTableCell.self, forCellReuseIdentifier: MainTableCell.reuseId)
        t.backgroundColor = .lightGray
        t.delegate = self
        t.dataSource = self
        t.layer.cornerRadius = 10
        t.layer.masksToBounds = true
        return t
    }()
    private var detailView = DetailInfoProductView()
    
// MARK: - Properties -
    var output: MainViewOutput!
    weak var detailViewInput: DetailInfoViewInput?
    private var products: [ProductModel] = []

// MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.output.viewIsReady()
        self.setupViews()
        self.output.loadProducts(page: 1, categoryId: 1)
    }
    
    private func setupViews() {
        self.title = "Products"
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        self.detailViewInput = detailView
        
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)])
    }
    
    private func showDetailView() {
        if self.view.subviews.contains(self.detailView) {
            self.detailView.removeFromSuperview()
        }
        self.detailView.output = self
        self.view.addSubview(detailView)
        
        NSLayoutConstraint.activate([
            self.detailView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.detailView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.detailView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.detailView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 1.5)])
    }
    
    private func hideDeteailView() {
        self.detailView.removeFromSuperview()
    }
}

// MARK: - MainViewInput
extension MainViewController: MainViewInput {
    func didLoadProgucts(items: [ProductModel]) {
        self.products = items
        self.tableView.reloadData()
    }
    
    func didLoadDetailInfoProduct(item: ProductModel) {
        self.detailView.configure(prod: item)
    }
    
    func didloadComments(items: [CommentModel]) {
        self.detailViewInput?.didLoadComments(items: items)
    }
}

extension MainViewController: DetailInfoViewOutput {
    func didTapCloseButton() {
        self.hideDeteailView()
    }
    
    func didTapAddButton() {}
}

// MARK: - UITableViewDelegate/DataSource -
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableCell.reuseId, for: indexPath) as? MainTableCell else { return UITableViewCell() }
        let product = self.products[indexPath.row]
        cell.configure(product: product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let prod = products[indexPath.row]
        self.showDetailView()
        self.output.reportEventOpenDetailProductInfo(name: prod.name)
        self.output.loadDetailInfoProduct(id: prod.id ?? 0)
        self.output.loadComments(id: prod.id ?? 0)
    }
}
