//
//  CoffeePictureSelectionViewModel.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 11/18/25.
//

import SwiftUI
import Combine

protocol CoffeePictureSelectionLogic {
    func getCoffeePicture() -> Image?
    func favoriteCurrentPicture()
}

@MainActor
final class CoffeePictureSelectionViewModel: ObservableObject, CoffeePictureSelectionLogic {
    @Published var currentImage: Image?

    init(currentImage: Image? = nil) {
        self.currentImage = currentImage
    }

    func getCoffeePicture() -> Image? {
        // TODO: - Call APIService
        return nil
    }

    func favoriteCurrentPicture() {
        // TODO: - Implement Favorite Picture
    }
}
