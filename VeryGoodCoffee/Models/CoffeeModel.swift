//
//  CoffeeModel.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 11/18/25.
//

import UIKit
import SwiftData

@Model
final class Coffee: Identifiable {
    @Attribute(.unique) var id = UUID()
    @Attribute(.externalStorage) var coffeeImageData: Data?

    init(coffeeImageData: Data?) {
        self.coffeeImageData = coffeeImageData
    }

    var coffeeImage: UIImage? {
        if let coffeeImageData {
            return UIImage(data: coffeeImageData)
        }
        return nil
    }
}
