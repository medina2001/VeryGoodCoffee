//
//  FavoritePicturesView.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 20/11/25.
//

import SwiftUI
import SwiftData

struct FavoritePicturesView: View {
    @Query var favoritePictures: [Coffee]
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(favoritePictures) { coffee in
                    if let coffeeImage = coffee.coffeeImage {
                        Image(uiImage: coffeeImage)
                            .resizable()
                            .scaledToFit()
                            .clipped()
                            .cornerRadius(16)
                    }
                }
            }.padding()
        }
    }
}

#Preview {
    FavoritePicturesView()
}
