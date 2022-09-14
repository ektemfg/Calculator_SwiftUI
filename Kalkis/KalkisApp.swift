//
//  KalkisApp.swift
//  Kalkis
//
//  Created by Dimitrije Pesic on 09/09/2022.
//

import SwiftUI

@main
struct KalkisApp: App {
    var body: some Scene {
        WindowGroup {
            CalculatorView()
                .environmentObject(CalculatorView.ViewModel())
        }
    }
}
