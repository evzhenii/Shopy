//
//  ProductCollectionView.swift
//  Shopy
//
//  Created by boockich mac on 10.11.2022.
//

import UIKit

class ProductCollectionView: UICollectionView {

    var products: [Product]? = nil
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Constants.ProductCollectionView.minimumLineSpacing
        super.init(frame: .zero, collectionViewLayout: layout)
        delegate = self
//        dataSource = self
        
        register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: Constants.productCellIdentifier)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setProducts(with products: [Product]) {
        self.products = products
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

//extension ProductCollectionView: UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        return products?.count ?? 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        guard let cell = dequeueReusableCell(withReuseIdentifier: Constants.productCellIdentifier, for: indexPath) as? ProductCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//
//        if let product = products?[indexPath.row] {
//            cell.title.text = product.title
//        }
//
//        return cell
//    }
//}
//
extension ProductCollectionView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.ProductCollectionView.productItemWidth,
                      height: Constants.ProductCollectionView.productItemHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Constants.ProductCollectionView.topDistanceToView,
                            left: Constants.ProductCollectionView.leftDistanceToView,
                            bottom: Constants.ProductCollectionView.bottomDistacneToView,
                            right: Constants.ProductCollectionView.rightDistanceToView)
    }
}
