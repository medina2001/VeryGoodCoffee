//
//  FavoritePictureButton.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 19/11/25.
//

import SwiftUI

struct FavoritePictureButton: View {
    @Binding var isFavoritePicture: Bool
    let addFavoriteCoffee: () -> Void
    
    var body: some View {
        Button {
            withAnimation {
                isFavoritePicture.toggle()
            }
        } label: {
            Image(systemName: isFavoritePicture ? "star.fill" : "star")
                .font(.title)
                .padding()
                .foregroundStyle(isFavoritePicture ? .yellow : .white)
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
