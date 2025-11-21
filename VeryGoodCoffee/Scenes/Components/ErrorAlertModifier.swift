//
//  ErrorAlertModifier.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 20/11/25.
//

import SwiftUI

struct ErrorAlertModifier: ViewModifier {
    @Binding var error: VGError?
    let retryAction: () -> Void
    
    func body(content: Content) -> some View {
        content
            .alert(item: $error) { error in
                Alert(
                    title: Text("Error"),
                    message: Text(error.errorDescription ?? "Something Happened"),
                    primaryButton: .default(Text("Try again"), action: retryAction),
                    secondaryButton: .cancel(Text("OK"))
                )
            }
    }
}

extension View {
    func errorAlert(error: Binding<VGError?>, retryAction: @escaping () -> Void) -> some View {
        modifier(ErrorAlertModifier(error: error, retryAction: retryAction))
    }
}
