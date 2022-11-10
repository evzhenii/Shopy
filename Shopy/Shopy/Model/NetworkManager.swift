//
//  ShopyManager.swift
//  Shopy
//
//  Created by boockich mac on 09.11.2022.
//

import Foundation
import UIKit

protocol NetworkManagerDelegate {
    func presentError(_ error: String)
}

struct NetworkManager {
    
    var delegate: NetworkManagerDelegate?
    
    func loadShop(completion: @escaping ((Shop?) -> Void)) {
        guard let url = URL(string: Constants.url) else {
            delegate?.presentError(Constants.Errors.cannotConvertURL)
            return
        }
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                delegate?.presentError(error.localizedDescription)
                return
            }
            
            guard let safeData = data else {
                delegate?.presentError(Constants.Errors.missingData)
                return
            }
            if let shop = parseJSON(safeData) {
                completion(shop)
            }
        }
        task.resume()
    }
    
    private func parseJSON(_ data: Data) -> Shop? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Shop.self, from: data)
            return decodedData
        } catch {
            delegate?.presentError(error.localizedDescription)
            return nil
        }
    }
    
    func getImage(with url: String) -> UIImage? {
        if let url = URL(string: url) {
            do {
                let data = try Data(contentsOf: url)
                return UIImage(data: data)
            } catch {
                delegate?.presentError(error.localizedDescription)
            }
        }
        return nil
    }
}
