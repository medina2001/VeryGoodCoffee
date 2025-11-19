//
//  CoffeeAPIService.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 11/18/25.
//

import Foundation

protocol CoffeeAPIServiceProtocol {
    func fetchRandomCoffeePicture(completion: @escaping (Result<URL, Error>) -> Void)
}

final class CoffeeAPIService: CoffeeAPIServiceProtocol {
    func fetchRandomCoffeePicture(completion: @escaping (Result<URL, any Error>) -> Void) {
        // TODO: - Implement API Call
    }
}
