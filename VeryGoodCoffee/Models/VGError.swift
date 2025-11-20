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
            return "Services offline, try again later."
        case .invalidResponse:
            return "Services offline, try again later."
        case .noDataAvailable:
            return "No images available at the moment, try again later."
        case .unknown:
            return "Something Happened, try again later."
        }
    }
}
