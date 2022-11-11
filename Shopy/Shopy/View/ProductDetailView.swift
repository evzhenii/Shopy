//
//  PhotoCarouselView.swift
//  Shopy
//
//  Created by boockich mac on 10.11.2022.
//

import UIKit

class ProductDetailView: UIView {
    
    // MARK: - SubViews
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        return label
    }()
    
    private let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constants.starSystemImageName)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .red
        return imageView
    }()
    
    private let ratingView = UIView()
    
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
    
    let informationView = InformationView()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setups
private extension ProductDetailView {
    
    func setupUI() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(productNameLabel)
        mainStackView.addArrangedSubview(ratingView)
        
        ratingView.addSubview(starImageView)
        ratingView.addSubview(ratingLabel)
        
        mainStackView.addArrangedSubview(priceLabel)
        mainStackView.addArrangedSubview(informationView)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        starImageView.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            starImageView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            starImageView.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor),
            ratingLabel.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: 5),
            ratingLabel.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor),
        ])
    }
}
