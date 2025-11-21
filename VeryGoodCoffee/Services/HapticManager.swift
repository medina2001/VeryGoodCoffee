//
//  HapticManager.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 20/11/25.
//

import UIKit

final class HapticManager {
    static let shared = HapticManager()
    
    private init() {}
    
    func success() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    func error() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
}
