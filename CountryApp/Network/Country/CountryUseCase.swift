//
//  CountryUseCase.swift
//  CountryApp
//
//  Created by Khalida Aliyeva on 22.02.25.
//

import Foundation

protocol CountryUseCase {
    
    func getCountry(completion: @escaping((CountryList?, CoreErrorModel?) -> Void?))
    
}
