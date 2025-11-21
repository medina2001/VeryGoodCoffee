//
//  EmptyCoffeeView.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 20/11/25.
//

import SwiftUI

struct EmptyCoffeeView: View {
    let tryAgain: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            VStack (alignment: .center) {
                Image(systemName: "cup.and.heat.waves")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
                    .padding()
                Text("No pictures available at the moment")
                    .font(.title2)
                    .padding()
                if let tryAgain {
                    Button {
                        tryAgain()
                    } label: {
                        Text("Try again")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .padding()
                            .background(.blue)
                            .clipShape(.capsule)
                    }
                    .padding()
                }
            }
            Spacer()
        }
    }
}
