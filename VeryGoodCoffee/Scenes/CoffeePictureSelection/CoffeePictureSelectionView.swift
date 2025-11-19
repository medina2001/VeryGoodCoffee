//
//  CoffeePictureSelectionView.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 11/18/25.
//

import SwiftUI
import Combine

struct CoffeePictureSelectionView: View {
    @StateObject var viewModel = CoffeePictureSelectionViewModel()
    
    var body: some View {
        ZStack {
            if let coffeeImage = viewModel.currentCoffeeImage {
                Image(uiImage: coffeeImage)
                    .resizable()
                    .scaledToFit()
                    .padding(32)
                    .foregroundStyle(.brown)
                    .cornerRadius(20)
                    .onTapGesture {
                        Task {
                            await viewModel.getCoffeePicture()
                        }
                    }
            } else {
                VStack (alignment: .center) {
                    Button {
                        Task {
                            await viewModel.getCoffeePicture()
                        }
                    } label: {
                        Text("Get new coffee image")
                    }
                }
            }
            
            if viewModel.isLoading {
                VStack (alignment: .center) {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            }
        }
    }
}
