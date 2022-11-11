//
//  ProductViewController.swift
//  Shopy
//
//  Created by boockich mac on 10.11.2022.
//

import UIKit

final class ProductDetailViewController: UIViewController {
    
    // MARK: - SubViews
    private let galleryView = GalleryView()
    
    private var productDetailView = ProductDetailView()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Setups
private extension ProductDetailViewController {
    func setupUI() {
        view.backgroundColor = .tertiarySystemBackground
        
        view.addSubview(galleryView)
        view.addSubview(productDetailView)
        
        galleryView.translatesAutoresizingMaskIntoConstraints = false
        productDetailView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            galleryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            galleryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            galleryView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            galleryView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.7 + 30),
            
            productDetailView.topAnchor.constraint(equalTo: galleryView.bottomAnchor, constant: 10),
            productDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            productDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
}

// MARK: - Public methods
extension ProductDetailViewController {
    public func setProductProperties(_ product: Product) {
        productDetailView.productNameLabel.text = product.title
        productDetailView.priceLabel.text = "\(product.price) $"
        productDetailView.ratingLabel.text = "Rating " + String(format: "%.1f", product.rating)
        productDetailView.informationView.descriptionLabel.text = "\(product.productDescription)"
        productDetailView.informationView.categoryDetailSubView.detailValueLabel.text = "\(product.category)"
        productDetailView.informationView.brandDetailSubView.detailValueLabel.text = "\(product.brand)"
        productDetailView.informationView.stockDetailSubView.detailValueLabel.text = "\(product.stock)"
    }
    
    public func setImages(with images: [UIImage]) {
        self.galleryView.configureView(with: images)
    }
}
