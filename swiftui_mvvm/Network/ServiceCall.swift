//
//  ServiceCall.swift
//  swiftui_mvvm
//
//  Created by MGunes on 15.09.2022.
//

import Foundation
import Alamofire

protocol ServiceCallProtocol {
    func getCryptoList(result : @escaping (CryptoListReturnEnum) -> Void)
}

class ServiceCall: ServiceCallProtocol {
    
    private let baseUrl = "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/"
    //private let baseUrl = "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/mater/"
    
    func getCryptoList(result : @escaping (CryptoListReturnEnum) -> Void) {
        result(.loading)
        AF.request(baseUrl+EndPoint.list.rawValue).responseDecodable(of: [CryptoItem].self) { response in
            
            guard let list = response.value else {
                result(.error(response.error?.localizedDescription ?? "Error"))
                return
            }
            
            result(.sucess(list))
            
        }
    }
}


enum EndPoint : String {
    case list = "crypto.json"
}


