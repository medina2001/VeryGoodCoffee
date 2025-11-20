//
//  CoffeePictureSelectionViewModel.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 11/18/25.
//

import SwiftUI
import UIKit
import Combine

@MainActor
final class CoffeePictureSelectionViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var currentCoffeeImage: UIImage?
    @Published var isLoading: Bool = false
    
    // MARK: - Private Properties
    
    private let coffeeAPIService: CoffeeAPIServiceProtocol?

    // MARK: - Init
    
    init(coffeeAPIService: CoffeeAPIServiceProtocol? = nil) {
        self.coffeeAPIService = coffeeAPIService ?? CoffeeAPIService()
    }

    // MARK: - Public Methods
    
    func getCoffeePicture() async {
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        do {
            let newImage = try await coffeeAPIService?.fetchRandomCoffeePicture() ?? Data()
            guard let newCoffeeImage = UIImage(data: newImage) else {
                return
            }
            currentCoffeeImage = nil
            currentCoffeeImage = newCoffeeImage
        } catch {
            print(error.localizedDescription)
        }
    }

    func favoriteCurrentPicture() {
        // TODO: - Implement Favorite Picture
    }
}
