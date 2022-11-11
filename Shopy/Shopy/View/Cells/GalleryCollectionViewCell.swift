//
//  GalleryCollectionViewCell.swift
//  Shopy
//
//  Created by boockich mac on 11.11.2022.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - SubViews
    let galleryImageView = UIImageView()
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setups
private extension GalleryCollectionViewCell {
    func setupUI() {
        backgroundColor = .clear

        contentView.addSubview(galleryImageView)
        galleryImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            galleryImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            galleryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            galleryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            galleryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            galleryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        galleryImageView.contentMode = .scaleAspectFit
    }
}

// MARK: - Public methods
extension GalleryCollectionViewCell {
    public func configure(_ image: UIImage) {
        galleryImageView.image = image
    }
}
