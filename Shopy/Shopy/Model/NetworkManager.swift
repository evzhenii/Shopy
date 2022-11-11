//
//  ShopyManager.swift
//  Shopy
//
//  Created by boockich mac on 09.11.2022.
//

import Foundation
import UIKit

// MARK: - Protocols
protocol NetworkManagerDelegate {
    func presentError(_ error: String)
}

// MARK: - NetworkManager
struct NetworkManager {
    
    // MARK: - Properties
    var delegate: NetworkManagerDelegate?
    
    // MARK: - Public methods
    public func loadShop(completion: @escaping ((Shop?) -> Void)) {
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
    
    public func getImage(with url: String) -> UIImage? {
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
    
    public func getImageArray(with urls: [String]) -> [UIImage] {
        return urls.compactMap { url in
            getImage(with: url)
        }
    }
}

// MARK: - Helpers
private extension NetworkManager {
    func parseJSON(_ data: Data) -> Shop? {
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
