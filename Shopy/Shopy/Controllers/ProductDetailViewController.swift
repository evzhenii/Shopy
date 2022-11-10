//
//  ProductViewController.swift
//  Shopy
//
//  Created by boockich mac on 10.11.2022.
//

import UIKit

final class ProductDetailViewController: UIViewController {
    
//    var product: Product?
    var productDetailView = ProductDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
        viewSetup()
        layoutSetup()
    }
    
    private func viewSetup() {
        view.addSubview(productDetailView)
    }
    
    func setProductProperties(_ product: Product) {
        productDetailView.productNameLabel.text = product.title
        productDetailView.priceLabel.text = "\(product.price) $"
        productDetailView.ratingLabel.text = "Rating " + String(format: "%.1f", product.rating)
        productDetailView.descriptionLabel.text = "\(product.productDescription)"
    }
    
    func setImages(with images: [UIImage]) {
        DispatchQueue.main.async {
            images.forEach { image in
                let newImage = UIImageView()
                newImage.image = image
                print(image)
                self.productDetailView.imageStackView.addArrangedSubview(newImage)
//                self.productDetailView.descriptionLabel.text = "a;lsdkfjals;djf;laksdjflkasdfjalskdfjal;sdfjasd;fladsjf"
            }
        }
    }
    
    private func layoutSetup() {
        NSLayoutConstraint.activate([
            productDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            productDetailView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            productDetailView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            productDetailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
