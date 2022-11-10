//
//  PhotoCarouselView.swift
//  Shopy
//
//  Created by boockich mac on 10.11.2022.
//

import UIKit

class ProductDetailView: UIView {
    
//    private var product: Product?
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillProportionally
        stackView.alignment = .top
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let imageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.frame.size.height = 700
        return stackView
    }()
    
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.heightAnchor.constraint(equalToConstant:
//                    500).isActive = true
        return imageView
    }()
    
    lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    private let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constants.starSystemImageName)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .red
        return imageView
    }()
    
    private let ratingStackView = UIStackView()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetup()
        layoutSetup()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func viewSetup() {
        
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(imageStackView)
        imageStackView.addArrangedSubview(productImageView)
        mainStackView.addArrangedSubview(productNameLabel)
        mainStackView.addArrangedSubview(ratingStackView)
        
        ratingStackView.addArrangedSubview(starImageView)
        ratingStackView.addArrangedSubview(ratingLabel)
        
        mainStackView.addArrangedSubview(priceLabel)
        mainStackView.addArrangedSubview(descriptionLabel)
    }
    
    private func layoutSetup() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
