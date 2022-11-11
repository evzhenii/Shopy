//
//  ProductViewController.swift
//  Shopy
//
//  Created by boockich mac on 10.11.2022.
//

import UIKit

final class ProductDetailViewController: UIViewController {
    
//    private var images: [UIImage]?
//    private let stackView = VerticalStackView()
    private let galleryView = GalleryView()
//    private let carouselCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
//        layout.scrollDirection = .horizontal
////        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        return collectionView
//    }()
    
    private var productDetailView = ProductDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
        
//        view.addSubview(galleryView)
        
//        view.addSubview(carouselCollectionView)
//        carouselCollectionView.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.galleryCellIdentifier)
//        carouselCollectionView.delegate = self
//        carouselCollectionView.dataSource = self
        
        viewSetup()
        layoutSetup()
        
    }
    
    func setProductProperties(_ product: Product) {
        productDetailView.productNameLabel.text = product.title
        productDetailView.priceLabel.text = "\(product.price) $"
        productDetailView.ratingLabel.text = "Rating " + String(format: "%.1f", product.rating)
        productDetailView.descriptionLabel.text = "\(product.productDescription)"
    }
    
    func setImages(with images: [UIImage]) {
//        self.images = images
        self.galleryView.configureView(with: images)
//            self.carouselCollectionView.reloadData()
    }
    
    private func viewSetup() {
        view.addSubview(galleryView)
        view.addSubview(productDetailView)
    }
    
    private func layoutSetup() {
        galleryView.translatesAutoresizingMaskIntoConstraints = false
        productDetailView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            galleryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            galleryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            galleryView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            galleryView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.8),
            
            productDetailView.topAnchor.constraint(equalTo: galleryView.bottomAnchor, constant: 10),
            productDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            productDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
}

//// MARK: - UICollectionViewDelegate
//extension ProductDetailViewController: UICollectionViewDelegate {
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectItem(at: indexPath, animated: true)
//    }
//
//}
//
//// MARK: - UICollectionViewDataSource
//extension ProductDetailViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return images?.count ?? 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.galleryCellIdentifier, for: indexPath) as? GalleryCollectionViewCell else {
//            print("aaa")
//            return UICollectionViewCell()
//        }
//
//        if let image = images?[indexPath.row] {
//            cell.galleryImageView.image = image
//        }
////        cell.imageView?.image = images[indexPath.row]
//        return cell
//    }
//}
