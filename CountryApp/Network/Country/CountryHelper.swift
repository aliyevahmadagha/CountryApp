//
//  AllCountryHelper.swift
//  CountryApp
//
//  Created by Khalida Aliyeva on 22.02.25.
//

import Foundation

enum CountryHelper {
    
    case all
    
    var endPoint: String {
        switch self {
        case .all:
            return ""
        }
    }
    
    var mainPath: String {
        return "all"
    }
    
    var path: URL? {
        return CoreAPIHelper.instance.makeURL(path: mainPath + endPoint)
    }
}


