//
//  CryptoListItemView.swift
//  swiftui_mvvm
//
//  Created by MGunes on 15.09.2022.
//

import SwiftUI

struct CryptoListItemView: View {
    let cryptoCurrency: CryptoItem
        var body: some View {
            VStack {
                Text(cryptoCurrency.currency).font(.title).foregroundColor(.white)
                Text(cryptoCurrency.price).font(.title).foregroundColor(.white)
            }.frame(maxWidth: .infinity, maxHeight: 100)
                .backgroundColor(.red).cornerRadius(10)
            
        }
}

struct CryptoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoListItemView(cryptoCurrency: CryptoItem(currency: "Currency", price: "1.09"))
    }
}
