//
//  Constants.swift
//  Shopy
//
//  Created by boockich mac on 09.11.2022.
//

import Foundation
import UIKit

struct Constants {
    
    static let url = "https://dummyjson.com/products"
    
    static let productCellIdentifier = "ProductTableViewCell"
    
    static let galleryCellIdentifier = "GalleryTableViewCellIdentifier"
    
    static let errorSystemImageName = "icloud.slash"
    
    static let starSystemImageName = "star.fill"
    
    struct ProductCollectionView {
        
        static let topDistanceToView: CGFloat = 10
        
        static let bottomDistacneToView: CGFloat = 10
        
        static let leftDistanceToView: CGFloat = 10

        static let rightDistanceToView: CGFloat = 10
        
        static let minimumLineSpacing: CGFloat = 10
        
        static let productItemWidth = UIScreen.main.bounds.width / 2 -
                                       Constants.ProductCollectionView.leftDistanceToView -
                                       Constants.ProductCollectionView.rightDistanceToView
        
        static let productItemHeight = UIScreen.main.bounds.height / 3

    }
    
    struct Errors {
        
        static let missingData = "Wow, I couldn`t get data from server. That is strange. Already trying to fix it. Thanks for your patience, try again later"
        
        static let cannotConvertURL = "No way, URL is not avaliable at the moment. Refresh or try again later."
        
        static let lostConnection = "Well, I`ve tried to connect to the Internet, but failed. I`m smart enough to save all the necessary data, just notifying about connection."
        
    }
}
