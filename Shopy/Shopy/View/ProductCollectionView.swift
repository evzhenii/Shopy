//
//  ProductCollectionView.swift
//  Shopy
//
//  Created by boockich mac on 10.11.2022.
//

import UIKit

class ProductCollectionView: UICollectionView {

    // MARK: - Properties
    var products: [Product]? = nil
    
    // MARK: - Initializers
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Constants.ProductCollectionView.minimumLineSpacing
        super.init(frame: .zero, collectionViewLayout: layout)
        
        register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: Constants.productCellIdentifier)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods
extension ProductCollectionView {
    public func setProducts(with products: [Product]) {
        self.products = products
    }
}
