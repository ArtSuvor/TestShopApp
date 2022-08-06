//
//  BasketProductCell.swift
//  TestShopApp
//
//  Created by Art on 06.08.2022.
//

import UIKit

final class BasketProductCell: UITableViewCell {
    static let reuseId = String(describing: BasketProductCell.self)
    
// MARK: - UI -
    private let nameLabel: UILabel = {
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let countLabel: UILabel = {
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: BasketProduct) {
        self.nameLabel.text = model.name
        self.countLabel.text = self.getCountText(model.count)
    }
    
    private func getCountText(_ count: Int) -> String {
        "В корзине находится \(count) шт"
    }
}

extension BasketProductCell {
    private func setupUI() {
        self.selectionStyle = .none
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(countLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5),
        
            countLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            countLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            countLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5),
            countLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5)])
    }
}
