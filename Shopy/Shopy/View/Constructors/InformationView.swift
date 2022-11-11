//
//  InformationDetailView.swift
//  Shopy
//
//  Created by boockich mac on 11.11.2022.
//

import UIKit

final class InformationView: UIView {
    
    // MARK: - SubViews
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let informationTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "Information"
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    let brandDetailSubView = DetailSubView(frame: CGRectZero, with: "Brand")
    let divider1 = DividerView()
    let categoryDetailSubView = DetailSubView(frame: CGRectZero, with: "Category")
    let divider2 = DividerView()
    let stockDetailSubView = DetailSubView(frame: CGRectZero, with: "Left in stock")
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setups
private extension InformationView {
    func setupUI() {
        addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(informationTitleLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        verticalStackView.addArrangedSubview(brandDetailSubView)
        verticalStackView.addArrangedSubview(divider1)
        verticalStackView.addArrangedSubview(categoryDetailSubView)
        verticalStackView.addArrangedSubview(divider2)
        verticalStackView.addArrangedSubview(stockDetailSubView)
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
