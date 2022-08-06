//
//  CommentCell.swift
//  TestShopApp
//
//  Created by Art on 16.07.2022.
//

import UIKit

final class CommentCell: UITableViewCell {
    static let reuseId = String(describing: CommentCell.self)
    
// MARK: - UI -
    private let ownerLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 15)
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private let commentLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 17)
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        return l
    }()
    
// MARK: - Init -
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Public -
    func configure(model: CommentModel) {
        self.ownerLabel.text = "Owner: \(model.userId)"
        self.commentLabel.text = model.commentText
    }
    
// MARK: - Private -
    private func setupViews() {
        self.addSubview(ownerLabel)
        self.addSubview(commentLabel)
        
        NSLayoutConstraint.activate([
            ownerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            ownerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            ownerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
        
            commentLabel.topAnchor.constraint(equalTo: ownerLabel.bottomAnchor, constant: 5),
            commentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            commentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            commentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)])
    }
}
