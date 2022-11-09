//
//  ViewController.swift
//  Shopy
//
//  Created by boockich mac on 09.11.2022.
//

import UIKit

class ViewController: UIViewController {

    var shopyManager = ShopyManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        self.title = "Shopy"
        
        shopyManager.loadShop { shop in
            print(shop?.products[0].title)
        }
    }


}

extension ViewController: ShopyManagerDelegate {
    func presentError(_ error: String) {
        print(error)
    }
    
    
}
