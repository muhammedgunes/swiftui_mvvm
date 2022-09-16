//
//  CyrpoCurrencyListView.swift
//  swiftui_mvvm
//
//  Created by MGunes on 15.09.2022.
//

import SwiftUI

struct CyrpoCurrencyListView: View {
    
    @StateObject var viewModel : CryptoCurrencyListViewModel = CryptoCurrencyListViewModel()
    @State private var showErrorAlert = false
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                Button("Retry") {
                    viewModel.getCyrptoList()
                }.foregroundColor(.red)
                Spacer()
                switch viewModel.crypoListEnum {
                case .error(let errorMessage):
                    AlertView(alertDetail: AlertDetail(title: "Service Error", message: errorMessage, primaryButton: Alert.Button.destructive(Text("Cancel")){
                        
                    }, secondaryButton: Alert.Button.default(Text("Retry")) {
                        viewModel.getCyrptoList()
                    }))
                case.sucess(let list):
                    ListView(crypoList: list)
                case.loading:
                    ActivityIndicator(isAnimating: true) {
                        $0.color = .red
                        $0.hidesWhenStopped = false
                    }
                case .none:
                    Text("Deneme")
                }
                
                Spacer()
            }.onAppear() {
                viewModel.getCyrptoList()
            }

        }
    }
    
}

struct CyrpoCurrencyListView_Previews: PreviewProvider {
    static var previews: some View {
        CyrpoCurrencyListView()
    }
}

private struct ListView : View {
    
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
