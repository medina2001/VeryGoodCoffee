//
//  LoadingView.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 19/11/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack (alignment: .center) {
            Spacer()
            Image(systemName: "cup.and.heat.waves.fill")
                .font(.largeTitle)
                .symbolEffect(.breathe)
            Spacer()
        }
    }
}
