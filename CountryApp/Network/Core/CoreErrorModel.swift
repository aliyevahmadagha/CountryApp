//
//  CoreErrorModel.swift
//  CountryApp
//
//  Created by Khalida Aliyeva on 12.01.25.
//

import Foundation

struct CoreErrorModel: Error, Decodable {
    let code: Int?
    let message: String?
    
    
    static func authError(code: Int) -> CoreErrorModel {
        return CoreErrorModel(code: code, message: "please login")
    }
    
    static func generalError() -> CoreErrorModel {
        return CoreErrorModel(code: 500, message: "unexpected error")
    }

    static func decodingError() -> CoreErrorModel {
        return CoreErrorModel(code: 0, message: "Can not parse json")
    }
}
