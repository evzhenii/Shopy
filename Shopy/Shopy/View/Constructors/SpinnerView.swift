//
//  SpinnerView.swift
//  Shopy
//
//  Created by boockich mac on 10.11.2022.
//

import UIKit

final class SpinnerView: UIView {
    
    // MARK: - SubViews
    let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.hidesWhenStopped = true
        spinner.style = .large
        spinner.startAnimating()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
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
private extension SpinnerView {
    func setupUI() {
        backgroundColor = .systemBackground
        
        addSubview(spinner)
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
