//
//  Constants.swift
//  Shopy
//
//  Created by boockich mac on 09.11.2022.
//

import Foundation

struct Constants {
    
    static let url = "https://dummyjson.com/products"
    
    static let employeeTableViewCellIdentifier = "ProductTableViewCell"
    
    static let companyJSONKey = "shopJSONKey"
    
    static let nwPathMonitorQueue = "Network"
    
    static let noInternetSystemImage = "wifi.slash"
    
    static let genericErrorMessage = "Whoops, I got an error :("
    
    static let pullToRefresh = "Pull to refresh"
    
    struct Errors {
        static let missingData = "Wow, I couldn`t get data from server. That is strange. Already trying to fix it. Thanks for your patience, try again later"
        
        static let cannotConvertURL = "No way, URL is not avaliable at the moment. Refresh or try again later."
        
        static let lostConnection = "Well, I`ve tried to connect to the Internet, but failed. I`m smart enough to save all the necessary data, just notifying about connection."
        
    }
}
