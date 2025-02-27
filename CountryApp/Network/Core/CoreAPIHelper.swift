//
//  CoreAPIHelper.swift
//  CountryApp
//
//  Created by Khalida Aliyeva on 12.01.25.
//


import Foundation

enum HttpMethods: String {
    case GET
    case POST
    case PATCH
    case PUT
    case DELETE
}

enum BaseURL: String {
    case country = "https://restcountries.com/v3.1/"
}

final class CoreAPIHelper {
    static let instance = CoreAPIHelper()
    private init() {}
    
    private let baseURL = BaseURL.country.rawValue
    
    func makeURL(path: String) -> URL? {
        let urlString = baseURL + path
        return URL(string:urlString)
    }
//    
//    func makeHeader() -> [String: String] {
//        return ["Authoration": "Barear Token"]
//    }
}
