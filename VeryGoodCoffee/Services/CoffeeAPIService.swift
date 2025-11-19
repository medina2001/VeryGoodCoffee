//
//  CoffeeAPIService.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 11/18/25.
//

import Foundation

protocol CoffeeAPIServiceProtocol {
    func fetchRandomCoffeePicture() async throws -> Data
}

final class CoffeeAPIService: CoffeeAPIServiceProtocol {
    
    // MARK: - Public Methods
    
    func fetchRandomCoffeePicture() async throws -> Data {
        let endpoint = Path.randomPhoto.path
        
        guard let url = URL(string: endpoint) else {
            throw VGError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.cachePolicy = .reloadIgnoringLocalCacheData
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw VGError.invalidResponse
        }
        
        return data
    }
}
