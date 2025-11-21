//
//  FavoritePictureButton.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 19/11/25.
//

import SwiftUI

struct FavoritePictureButton: View {
    @Binding var isFavoritePicture: Bool
    let addFavoriteCoffee: () -> ()
    
    var body: some View {
        Button {
            withAnimation {
                addFavoriteCoffee()
            }
        } label: {
            Image(systemName: isFavoritePicture ? "star.fill" : "star")
                .font(.title)
                .padding()
                .foregroundStyle(isFavoritePicture ? .yellow : .primary)
                .shadow(color: .black.opacity(0.3), radius: 2)
                .contentTransition(
                    .symbolEffect(
                        .replace.magic(
                            fallback: .downUp.byLayer
                        ),
                        options: .repeat(
                            .continuous
                        )
                    )
                )
        }
    }
}
