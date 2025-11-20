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
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Coffee.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            CoffeePictureSelectionView()
        }
        .modelContainer(sharedModelContainer)
    }
}
