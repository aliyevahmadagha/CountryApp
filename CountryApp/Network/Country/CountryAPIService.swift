//
//  CountryAPIService.swift
//  CountryApp
//
//  Created by Khalida Aliyeva on 22.02.25.
//

import Foundation

final class CountryAPIService: CountryUseCase {
    
    func getCountry(completion: @escaping((CountryList?, CoreErrorModel?) -> Void?)) {
        CoreAPIManager.instance.request(
            type: CountryList.self,
            url: CountryHelper.all.path,
            method: .GET) { [weak self] result in
                guard let _ = self else {return}
                switch result {
                    case .success(let data):
                        completion(data, nil)
                    case .failure(let error):
                        completion(nil, error)
                }
            }
    }
    
}
