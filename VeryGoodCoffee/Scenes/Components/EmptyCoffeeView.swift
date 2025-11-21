//
//  EmptyCoffeeView.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 20/11/25.
//

import SwiftUI

struct EmptyCoffeeView: View {
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            VStack {
                Image(systemName: "cup.and.heat.waves")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
                    .padding()
                Text("No coffee images available at the moment")
                    .font(.largeTitle)
                    .padding()
            }
            Spacer()
        }
    }
}
