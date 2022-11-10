//
//  ProductViewController.swift
//  Shopy
//
//  Created by boockich mac on 10.11.2022.
//

import UIKit

final class ProductDetailViewController: UIViewController {
    
    var product: Product?
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
//        self.product = product
//        DispatchQueue.main.async { [self] in
            productDetailView.productNameLabel.text = product.title
            productDetailView.priceLabel.text = "\(product.price) $"
//        }
    }
    
    private func layoutSetup() {
        NSLayoutConstraint.activate([
            productDetailView.topAnchor.constraint(equalTo: view.topAnchor),
            productDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
