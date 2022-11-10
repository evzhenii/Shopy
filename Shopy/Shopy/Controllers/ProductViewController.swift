//
//  ProductViewController.swift
//  Shopy
//
//  Created by boockich mac on 10.11.2022.
//

import UIKit

final class ProductViewController: UIViewController {
    
    var product: Product
    
    
    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
//        self.title = product.title
//        print(product.price)
        // Do any additional setup after loading the view.
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
