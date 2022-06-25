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
    
    weak var output: DetailInfoViewOutput?
        
// MARK: - Init -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Public -
    func configure(prod: ProductModel) {
        self.nameLabel.text = prod.name
        self.priceLabel.text = "\(prod.price)"
    }
    
// MARK: - Private -
    private func setupView() {
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 30
        self.layer.masksToBounds = true
        self.addSubview(nameLabel)
        self.addSubview(priceLabel)
        self.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100),
        
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            priceLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            closeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            closeButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 100)])
    }
    
    @objc private func closeButtonTapped() {
        self.output?.didTapCloseButton()
    }
}
