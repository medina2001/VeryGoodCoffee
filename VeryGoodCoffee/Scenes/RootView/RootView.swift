//
//  RootView.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 20/11/25.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            CoffeePictureSelectionView()
                .tabItem {
                    Label("New Coffee", systemImage: "cup.and.heat.waves")
                }
            FavoritePicturesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
        }
    }
}

#Preview {
    RootView()
}
