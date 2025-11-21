//
//  VeryGoodCoffeeApp.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 11/18/25.
//

import SwiftUI
import SwiftData

@main
struct VeryGoodCoffeeApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: [Coffee.self])
    }
}
