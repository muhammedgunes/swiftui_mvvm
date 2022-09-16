//
//  CyrptoCurrency.swift
//  swiftui_mvvm
//
//  Created by MGunes on 15.09.2022.
//

import Foundation

/*
 Identifiable for LazyVGrid
 */
struct CryptoItem: Codable, Identifiable {
    let currency : String
    let price : String
    
    var id: UUID {
        get {
            UUID()
        }
    }

}
