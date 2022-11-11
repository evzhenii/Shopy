//
//  ViewController.swift
//  Shopy
//
//  Created by boockich mac on 09.11.2022.
//

import UIKit

final class ShopViewController: UIViewController {

// MARK: - Private variables
    private var networkManager = NetworkManager()
    private let spinnerView = SpinnerView()
    private let imageCache = NSCache<AnyObject, AnyObject>()
    private var productCollectionView = ProductCollectionView()
//    private var imageURLString: String?
    private var shop: Shop?


// MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
        self.title = "Shopy"
        
        networkManager.delegate = self
        
        view.addSubview(productCollectionView)
        productCollectionView.frame = self.view.bounds
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        
        addSpinner()
        
        networkManager.loadShop { shop in
            self.shop = shop
            
            DispatchQueue.main.async {
                self.productCollectionView.reloadData()
                self.spinnerView.spinner.stopAnimating()
                self.spinnerView.removeFromSuperview()
                
            }
        }
    }
    
// MARK: - Private Functions
    private func addSpinner() {
        view.addSubview(spinnerView)
        spinnerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spinnerView.topAnchor.constraint(equalTo: view.topAnchor),
            spinnerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            spinnerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            spinnerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: - UICollectionViewDelegate
extension ShopViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let product = shop?.products[indexPath.row] else { return }
        let productDetailViewController = ProductDetailViewController()
        
        DispatchQueue.global().async {
            let imageArray = self.networkManager.getImageArray(with: product.images)
            
            DispatchQueue.main.async {
                productDetailViewController.setImages(with: imageArray)
            }
        }
        productDetailViewController.setProductProperties(product)
        self.navigationController?.pushViewController(productDetailViewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension ShopViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shop?.products.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.productCellIdentifier, for: indexPath) as? ProductCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if let product = shop?.products[indexPath.row] {
            cell.productNameLabel.text = product.title
            cell.ratingLabel.text = String(format: "%.1f", product.rating)
            cell.stockNumberLabel.text = "\(product.stock) left"
            cell.priceLabel.text = "\(product.price) $"
            cell.saleLabel.text = "-\(product.discountPercentage)%"
            
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

// MARK: - UICollectionViewDelegateFlowLayout
extension ShopViewController: UICollectionViewDelegateFlowLayout {

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


// MARK: - NetworkManagerDelegate
extension ShopViewController: NetworkManagerDelegate {
    
    func presentError(_ error: String) {
        print(error)
    }
}
