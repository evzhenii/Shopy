//
//  InformationDetailStackView.swift
//  Shopy
//
//  Created by boockich mac on 11.11.2022.
//

import UIKit

class DetailSubView: UIView {

    // MARK: - SubViews
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        return stackView
    }()
    
    private let spacer = UIView()

    let detailNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .gray
        return label
    }()
    
    let detailValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    
    // MARK: - Initializers
    init(frame: CGRect, with detailName: String) {
        super.init(frame: frame)
        setupUI()
        detailNameLabel.text = detailName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setups
private extension DetailSubView {
    func setupUI() {
        addSubview(stackView)
        stackView.addArrangedSubview(detailNameLabel)
        stackView.addArrangedSubview(spacer)
        stackView.addArrangedSubview(detailValueLabel)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
