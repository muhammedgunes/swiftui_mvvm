//
//  CyrpoCurrencyListViewDI.swift
//  swiftui_mvvm
//
//  Created by MGunes on 16.09.2022.
//

import SwiftUI

struct CyrpoCurrencyListViewDI: View {
    @StateObject private var viewModel : CryptoCurrencyListViewModelDI
    
    init(service : ServiceCallDI) {
        _viewModel = StateObject(wrappedValue: CryptoCurrencyListViewModelDI(service: service))
    }
    
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

struct CyrpoCurrencyListViewDI_Previews: PreviewProvider {
    static var previews: some View {
        CyrpoCurrencyListViewDI(service: ServiceCallDI.init(url: AppData.SERVICE_URL))
    }
}
