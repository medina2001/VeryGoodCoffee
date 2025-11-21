//
//  FavoritePicturesView.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 20/11/25.
//

import SwiftUI
import SwiftData

struct FavoritePicturesView: View {
    
    // MARK: - Private properties
    
    @Environment(\.modelContext) private var context
    @Query private var favoritePictures: [Coffee]
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("My Favorite Pictures")
                    .font(.title2)
                    .padding()
                Spacer()
            }
            ScrollView {
                if favoritePictures.isEmpty {
                    EmptyCoffeeView(tryAgain: nil)
                } else {
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(favoritePictures) { coffee in
                            if let coffeeImage = coffee.coffeeImage {
                                Image(uiImage: coffeeImage)
                                    .resizable()
                                    .scaledToFit()
                                    .clipped()
                                    .cornerRadius(16)
                                    .contextMenu {
                                        Button(role: .destructive) {
                                            withAnimation {
                                                context.delete(coffee)
                                                try? context.save()
                                            }
                                        } label: {
                                            Label("Remove Favorite", systemImage: "trash")
                                        }
                                    }
                            }
                        }
                    }.padding()
                }
            }
        }
    }
}

#Preview {
    FavoritePicturesView()
}
