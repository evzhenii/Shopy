//
//  ProductCollectionViewCell.swift
//  Shopy
//
//  Created by boockich mac on 10.11.2022.
//

import UIKit

final class ProductCollectionViewCell: UICollectionViewCell {
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let previewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant:
                    Constants.ProductCollectionView.productItemWidth).isActive = true
        return imageView
    }()
    
    let productNameLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 2
        return title
    }()
    
    private let ratingStackView = UIStackView()
    
    private let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constants.starSystemImageName)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .red
        return imageView
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private let spacerView1 = UIView()
    private let spacerView2 = UIView()
    
    let stockNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private let priceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        return stackView
    }()
    
    let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return priceLabel
    }()
    
    var saleLabel: UILabel = {
        let saleLabel = UILabel()
        saleLabel.layer.cornerRadius = 5
        saleLabel.layer.backgroundColor = UIColor.red.cgColor
        saleLabel.textColor = .white
        saleLabel.textAlignment = .center
        saleLabel.font = UIFont.systemFont(ofSize: 16)
        return saleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetup()
        layoutSetup()
    }

    
    private func viewSetup() {
        addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(previewImageView)
        verticalStackView.addArrangedSubview(productNameLabel)
        verticalStackView.addArrangedSubview(ratingStackView)
        
        ratingStackView.addArrangedSubview(starImageView)
        ratingStackView.addArrangedSubview(ratingLabel)
        ratingStackView.setCustomSpacing(10, after: ratingLabel)
        ratingStackView.addArrangedSubview(stockNumberLabel)
        ratingStackView.addArrangedSubview(spacerView1)
        
        
        verticalStackView.addArrangedSubview(priceStackView)
        priceStackView.addArrangedSubview(priceLabel)
        priceStackView.addArrangedSubview(saleLabel)
        priceStackView.addArrangedSubview(spacerView2)
    }
    
    private func layoutSetup() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: self.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            saleLabel.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
