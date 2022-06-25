//
//  MainTableCell.swift
//  TestShopApp
//
//  Created by Art on 25.06.2022.
//

import UIKit

final class MainTableCell: UITableViewCell {
    static let reuseId = String(describing: MainTableCell.self)
    
// MARK: - UI -
    private let nameLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 15)
        l.textColor = .black
        l.text = "dddddd"
        return l
    }()
    
    private let priceLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 15)
        l.textColor = .black
        l.text = "dddddd"
        return l
    }()
    
// MARK: - Init -
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Public -
    func configure(product: ProductModel) {
        self.nameLabel.text = product.name
        self.priceLabel.text = product.price
    }
    
// MARK: - Private -
    private func setLabels() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        self.addSubview(nameLabel)
        self.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:  -5),
        
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            priceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)])
    }
}
