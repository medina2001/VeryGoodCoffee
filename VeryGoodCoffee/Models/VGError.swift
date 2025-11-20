//
//  VGError.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 19/11/25.
//

import Foundation

enum VGError: Error, Identifiable {
    case invalidURL
    case invalidResponse
    case noDataAvailable
    case unknown
    
    var id: String { localizedDescription }
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid Response"
        case .noDataAvailable:
            return "No Data Available"
        case .unknown:
            return "Something Happened"
        }
    }
}
