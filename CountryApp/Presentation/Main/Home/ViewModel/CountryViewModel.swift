//
//  CountryViewModel.swift
//  CountryApp
//
//  Created by Khalida Aliyeva on 22.02.25.
//

import Foundation

final class CountryViewModel {
    
    enum ViewState {
        case loading
        case loaded
        case success
        case error(String)
    }
    private(set) var list: CountryList?
    private(set) var searchList: CountryList?
    
    var listener: ((ViewState) -> Void)?
    
    private let countryUsecase: CountryUseCase
    
    init() {
        countryUsecase = CountryAPIService()
    }
    
    func getCountryListRequest() {
        listener?(.loading)
        
        countryUsecase.getCountry { [weak self] data, error in
            guard let self = self else {return}
            listener?(.loaded)
            if let data = data {
                list = data
                searchList = data
                listener?(.success)
            } else if let error = error {
                listener?(.error(error.localizedDescription))
            }
        }
    }
    
    func sortedAToZList() {
        searchList = searchList?.sorted(by: {$0.title < $1.title})
        listener?(.success)
    }
    
    func sortedAreaList() {
        searchList = searchList?.sorted(by: {$0.area ?? 0.0 > $1.area ?? 0.0})
        listener?(.success)
    }
    
    func search(text: String) {
        if text.isEmpty {
           searchList = list
        } else {
            searchList = list?
                .filter({ $0.title.lowercased().contains(text.lowercased())})
        }
        listener?(.success)
    }
    func getProtocol(index: Int) -> CountryProtocol? {
        return searchList?[index]
    }
    
    func getItem(index: Int) -> CountryDTO? {
        return searchList?[index]
    }
    
    func getItems() -> Int {
        searchList?.count ?? 0
    }
}

