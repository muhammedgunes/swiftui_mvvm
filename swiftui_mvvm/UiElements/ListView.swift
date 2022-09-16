//
//  ListView.swift
//  swiftui_mvvm
//
//  Created by MGunes on 16.09.2022.
//

import SwiftUI

struct ListView: View {
    var crypoList : [CryptoItem]
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(crypoList) { item in
                        CryptoListItemView(cryptoCurrency: item)
                            .frame(height: 100)
                    }
                }
                .padding()
            }
        }
    }
}
