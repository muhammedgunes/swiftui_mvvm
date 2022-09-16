//
//  AlertView.swift
//  swiftui_mvvm
//
//  Created by MGunes on 16.09.2022.
//

import SwiftUI

struct AlertView: View {
    
    @State var alertDetail : AlertDetail?
    
    var body: some View {
        VStack {
            
        }
        .alert(item: $alertDetail) { alertDetail in
            Alert(title: Text(alertDetail.title)
                  ,message: Text(alertDetail.message)
                  ,primaryButton: alertDetail.primaryButton
                  ,secondaryButton: alertDetail.secondaryButton)
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(alertDetail: AlertDetail(title: "Test Title", message: "Test Message", primaryButton: Alert.Button.default(Text("Primary")){
            
        }, secondaryButton: Alert.Button.destructive(Text("Secondary")) {
            
        }))
    }
}

struct AlertDetail: Identifiable {
    var id = UUID()
    let title: String
    let message: String
    let primaryButton: Alert.Button
    let secondaryButton: Alert.Button
}

