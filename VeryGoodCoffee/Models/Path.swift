//
//  Path.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 19/11/25.
//


public enum Path: String {
    case randomPhoto
    case randomPhotoJSON
    
    var path: String {
        switch self {
        case .randomPhoto:
            return "https://coffee.alexflipnote.dev/rando"
        case .randomPhotoJSON:
            return "https://coffee.alexflipnote.dev/random.json"
        }
    }
}
