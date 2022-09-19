//
//  swiftui_mvvmApp.swift
//  swiftui_mvvm
//
//  Created by MGunes on 12.09.2022.
//

import SwiftUI

@main
struct swiftui_mvvmApp: App {
    var body: some Scene {
        WindowGroup {
            CyrpoCurrencyListView()
            //CyrpoCurrencyListViewDI(service: ServiceCallDI(url: AppData.SERVICE_URL))
        }
    }
}
