//
//  DetailInfoProduct.swift
//  TestShopApp
//
//  Created by Art on 25.06.2022.
//

import Foundation
import UIKit

protocol DetailInfoViewOutput: AnyObject {
    func didTapCloseButton()
    func didTapAddButton()
}

protocol DetailInfoViewInput: AnyObject {
    func didLoadComments(items: [CommentModel])
}

final class DetailInfoProductView: UIView {
// MARK: - UI -
    private let nameLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Тут могла быть"
        l.font = UIFont.systemFont(ofSize: 20)
        l.textColor = .black
        return l
    }()
    
    private let priceLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Ваша реклама"
        l.font = UIFont.systemFont(ofSize: 20)
        l.textColor = .black
        return l
    }()
    
    private let addCommentButton: UIButton = {
        let b = UIButton()
        b.setTitle("AddComment", for: .normal)
        b.backgroundColor = .lightGray
        b.setTitleColor(UIColor.black, for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.cornerRadius = 10
        b.layer.masksToBounds = true
        return b
    }()
    
    private let closeButton: UIButton = {
        let b = UIButton()
        b.setTitle("Close", for: .normal)
        b.backgroundColor = .lightGray
        b.setTitleColor(UIColor.black, for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.cornerRadius = 10
        b.layer.masksToBounds = true
        return b
    }()
    
    private let tableView: UITableView = {
        let t = UITableView()
        t.separatorStyle = .none
        t.translatesAutoresizingMaskIntoConstraints = false
        t.register(CommentCell.self, forCellReuseIdentifier: CommentCell.reuseId)
        return t
    }()
    
    weak var output: DetailInfoViewOutput?
    private var comments: [CommentModel] = []
        
// MARK: - Init -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Public -
    func configure(prod: ProductModel) {
        self.nameLabel.text = prod.name
        self.priceLabel.text = "\(prod.price)"
    }
// MARK: - Targets -
    @objc private func closeButtonTapped() {
        self.output?.didTapCloseButton()
    }
    
    @objc private func addCommentButtonTapped() {
        
    }
}

extension DetailInfoProductView: DetailInfoViewInput {
    func didLoadComments(items: [CommentModel]) {
        self.comments = items
        self.tableView.reloadData()
    }
}

// MARK: - Table Delegate/DataSource -
extension DetailInfoProductView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentCell.reuseId, for: indexPath) as? CommentCell else { return UITableViewCell() }
        cell.configure(model: comments[indexPath.row])
        return cell
    }
}

// MARK: - Setup -
extension DetailInfoProductView {
    private func setupViews() {
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 30
        self.layer.masksToBounds = true
        self.addSubview(nameLabel)
        self.addSubview(priceLabel)
        self.addSubview(addCommentButton)
        self.addSubview(closeButton)
        self.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        addCommentButton.addTarget(self, action: #selector(addCommentButtonTapped), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            priceLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            addCommentButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 30),
            addCommentButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            addCommentButton.heightAnchor.constraint(equalToConstant: 40),
            
            closeButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 30),
            closeButton.leadingAnchor.constraint(equalTo: addCommentButton.trailingAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            closeButton.widthAnchor.constraint(equalTo: addCommentButton.widthAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
        
            tableView.topAnchor.constraint(equalTo: addCommentButton.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
}
