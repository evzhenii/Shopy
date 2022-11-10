//
//  ViewController.swift
//  Shopy
//
//  Created by boockich mac on 09.11.2022.
//

import UIKit

final class ShopViewController: UIViewController {

    private var networkManager = NetworkManager()
    private let spinnerView = SpinnerView()
    private let imageCache = NSCache<AnyObject, AnyObject>()
    private var collectionView = ProductCollectionView()
//    private var imageURLString: String?
    private var shop: Shop?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
        self.title = "Shopy"
        
        networkManager.delegate = self
        
        view.addSubview(collectionView)
        collectionView.frame = self.view.bounds
//        collectionView.delegate = self
        collectionView.dataSource = self
        
        addSpinner()
        
        networkManager.loadShop { shop in
            self.shop = shop
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.spinnerView.spinner.stopAnimating()
                self.spinnerView.removeFromSuperview()
                
            }
        }
    }
    
    private func addSpinner() {
        view.addSubview(spinnerView)
        NSLayoutConstraint.activate([
            spinnerView.topAnchor.constraint(equalTo: view.topAnchor),
            spinnerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            spinnerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            spinnerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ShopViewController: UICollectionViewDelegate {
    
}

extension ShopViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shop?.products.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.productCellIdentifier, for: indexPath) as? ProductCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if let product = shop?.products[indexPath.row] {
            cell.titleLabel.text = product.title
            cell.priceLabel.text = "\(product.price) $"
            
            if let image = imageCache.object(forKey: product.thumbnail as AnyObject) as? UIImage {
//                imageURLString = product.thumbnail
                cell.previewImageView.image = image
                return cell
            }
            
            DispatchQueue.global().async {
                let image = self.networkManager.getImage(with: product.thumbnail)
//                if self.imageURLString == product.thumbnail {
                    DispatchQueue.main.async {
                        cell.previewImageView.image = image
//                    }
                }
                self.imageCache.setObject(image as AnyObject, forKey: product.thumbnail as AnyObject)
            }
            
        }
        return cell
    }
}


extension ShopViewController: NetworkManagerDelegate {
    func presentError(_ error: String) {
        print(error)
    }
}
