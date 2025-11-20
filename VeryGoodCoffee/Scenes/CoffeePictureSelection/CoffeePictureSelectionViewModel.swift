//
//  CoffeePictureSelectionViewModel.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 11/18/25.
//

import SwiftUI
import Combine
import SwiftData

@MainActor
final class CoffeePictureSelectionViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var isLoading: Bool = false
    @Published var currentError: VGError? = nil
    @Published var coffee: Coffee?
    
    
    // MARK: - Private Properties
    
    private let coffeeAPIService: CoffeeAPIServiceProtocol?
    private var tryAgain: (() -> Void)?

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
            currentError = nil
            coffee = Coffee(coffeeImageData: newImage)
        } catch {
            currentError = nil
            currentError = error as? VGError
            print(error.localizedDescription)
        }
    }

    func favoriteCurrentPicture() throws {
        if let coffee {
            // TODO: - Save on SwiftData
        }
    }
}
