//
//  ServiceCallDI.swift
//  swiftui_mvvm
//
//  Created by MGunes on 16.09.2022.
//

import Foundation

import Foundation
import Alamofire


class ServiceCallDI: ServiceCallProtocol {
    
    private var url = AppData.SERVICE_URL
    init(url : String) {
        self.url = url
    }
    
    func getCryptoList(result : @escaping (CryptoListReturnEnum) -> Void) {
        result(.loading)
        AF.request(url+EndPoint.list.rawValue).responseDecodable(of: [CryptoItem].self) { response in
            
            guard let list = response.value else {
                result(.error(response.error?.localizedDescription ?? "Error"))
                return
            }
            
            result(.sucess(list))
            
        }
    }
}
