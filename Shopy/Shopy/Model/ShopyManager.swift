//
//  ShopyManager.swift
//  Shopy
//
//  Created by boockich mac on 09.11.2022.
//

import Foundation

protocol ShopyManagerDelegate {
    func presentError(_ error: String)
}

struct ShopyManager {
    
    var delegate: ShopyManagerDelegate?
    
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
    
}
