//
//  CrptoCurrencyListViewModel.swift
//  swiftui_mvvm
//
//  Created by MGunes on 15.09.2022.
//

import Foundation

class CryptoCurrencyListViewModel: ObservableObject {
    
    @Published var crypoListEnum : CryptoListReturnEnum?
    private let service : ServiceCall = ServiceCall()
    
    func getCyrptoList()  {
        crypoListEnum = .loading
        service.getCryptoList { result in
            self.crypoListEnum = result
        }
    }
    
}


enum CryptoListReturnEnum {
    case loading
    case sucess([CryptoItem])
    case error(String)
}
