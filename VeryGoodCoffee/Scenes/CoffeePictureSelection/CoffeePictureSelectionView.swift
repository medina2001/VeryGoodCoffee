//
//  CoffeePictureSelectionView.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 11/18/25.
//

import SwiftUI

struct CoffeePictureSelectionView: View {
    var body: some View {
        ZStack {
            Image(systemName: "cup.and.heat.waves.fill")
                .resizable()
                .scaledToFit()
                .padding()
                .foregroundStyle(.brown)
        }
    }
}

#Preview {
    CoffeePictureSelectionView()
}
