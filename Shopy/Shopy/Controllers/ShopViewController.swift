//
//  ViewController.swift
//  Shopy
//
//  Created by boockich mac on 09.11.2022.
//

import UIKit

class ShopViewController: UIViewController {

    private var shopyManager = ShopyManager()
    private let spinnerView = SpinnerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
        shopyManager.delegate = self
        
        self.title = "Shopy"
        addSpinner()
        
        shopyManager.loadShop { shop in
            print(shop?.products[0].title)
            DispatchQueue.main.async {
                self.spinnerView.spinner.stopAnimating()
                self.spinnerView.removeFromSuperview()
            }
        }
    }
    
    private func addSpinner() {
        view.addSubview(spinnerView)
        NSLayoutConstraint.activate([
//            spinnerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            spinnerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            spinnerView.widthAnchor.constraint(equalTo: view.widthAnchor),
//            spinnerView.heightAnchor.constraint(equalTo: view.heightAnchor)
            spinnerView.topAnchor.constraint(equalTo: view.topAnchor),
            spinnerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            spinnerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            spinnerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }


}

extension ShopViewController: ShopyManagerDelegate {
    func presentError(_ error: String) {
        print(error)
    }
    
    
}
