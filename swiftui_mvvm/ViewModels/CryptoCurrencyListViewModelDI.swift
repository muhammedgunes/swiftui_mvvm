//
//  CryptoCurrencyListViewModelDI.swift
//  swiftui_mvvm
//
//  Created by MGunes on 16.09.2022.
//

import Foundation

class CryptoCurrencyListViewModelDI: ObservableObject {
    
    @Published var crypoListEnum : CryptoListReturnEnum?
    private let service : ServiceCallDI
    
    init(service : ServiceCallDI) {
        self.service = service
    }
    
    func getCyrptoList()  {
        crypoListEnum = .loading
        service.getCryptoList { result in
            self.crypoListEnum = result
        }
    }
    
}
