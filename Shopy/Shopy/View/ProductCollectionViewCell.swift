//
//  ProductCollectionViewCell.swift
//  Shopy
//
//  Created by boockich mac on 10.11.2022.
//

import UIKit

final class ProductCollectionViewCell: UICollectionViewCell {
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var previewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant:
                    Constants.ProductCollectionView.productItemWidth)
        .isActive = true
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 2
        return title
    }()
    
    lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return priceLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetup()
        layoutSetup()
    }

    
    private func viewSetup() {
        addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(previewImageView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(priceLabel)
    }
    
    private func layoutSetup() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: self.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
