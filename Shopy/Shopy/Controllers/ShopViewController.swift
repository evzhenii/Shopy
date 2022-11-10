//
//  ViewController.swift
//  Shopy
//
//  Created by boockich mac on 09.11.2022.
//

import UIKit

final class ShopViewController: UIViewController {

    private var shopyManager = ShopyManager()
    private let spinnerView = SpinnerView()
    private let tableView = UITableView()
    private var shop: Shop? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
        shopyManager.delegate = self
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.register(ProductTableViewCell.self,
                           forCellReuseIdentifier: Constants.productCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        self.title = "Shopy"
        addSpinner()
        
        shopyManager.loadShop { shop in
            self.shop = shop
            DispatchQueue.main.async {
                self.tableView.reloadData()
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

extension ShopViewController: ShopyManagerDelegate {
    func presentError(_ error: String) {
        print(error)
    }
}

extension ShopViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ShopViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shop?.products.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.productCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = shop?.products[indexPath.row].title
        return cell
    }
    
    
}
