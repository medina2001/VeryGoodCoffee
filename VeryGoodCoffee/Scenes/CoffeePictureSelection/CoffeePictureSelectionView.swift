//
//  CoffeePictureSelectionView.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 11/18/25.
//

import SwiftUI
import Combine
import SwiftData

struct CoffeePictureSelectionView: View {
    
    // MARK: - Private Properties
    
    @StateObject private var viewModel = CoffeePictureSelectionViewModel()
    @Environment(\.modelContext) private var context: ModelContext
    @State private var isFavoritePicture: Bool = false
    @Query var favoriteCoffees: [Coffee]
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            if let coffeeImage = viewModel.coffee?.coffeeImage {
                Image(uiImage: coffeeImage)
                    .resizable()
                    .scaledToFit()
                    .padding(16)
                    .onTapGesture {
                        Task {
                            isFavoritePicture = false
                            await viewModel.getCoffeePicture()
                        }
                    }
                    .opacity(viewModel.isLoading ? 0.4 : 1)
                    .animation(.default, value: viewModel.coffee?.coffeeImage)
                
                VStack {
                    HStack {
                        Spacer()
                        
                        FavoritePictureButton(isFavoritePicture: $isFavoritePicture) {
                            do {
                                try viewModel.favoriteCurrentPicture()
                            } catch {
                                print("Error")
                            }
                        }
                        .onChange(of: isFavoritePicture) {
                            if isFavoritePicture {
                                do {
                                    try viewModel.favoriteCurrentPicture()
                                } catch {
                                    print(error.localizedDescription)
                                }
                            }
                        }
                    }
                    Spacer()
                }
            } else {
                if !viewModel.isLoading && viewModel.coffee?.coffeeImage == nil {
                    VStack(alignment: .center) {
                        Spacer()
                        Button {
                            Task {
                                await viewModel.getCoffeePicture()
                            }
                        } label: {
                            Text("Get new coffee image")
                                .padding()
                                .foregroundStyle(.black)
                                .background(.blue)
                                .cornerRadius(16)
                        }
                        .padding(.bottom, 32)
                    }
                }
            }
            VStack {
                HStack {
                    Text("☕️: \(favoriteCoffees.count)")
                        .padding()
                        .foregroundStyle(.black)
                        .background(.blue)
                        .cornerRadius(16)
                        .animation(.easeInOut, value: favoriteCoffees.count)
                    Spacer()
                }
                .padding()
                Spacer()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }.alert(item: $viewModel.currentError) { error in
            Alert(
                title: Text("Error"),
                message: Text(error.errorDescription ?? "Something Happened"),
                primaryButton: .default(Text("Retry"), action: {
                    Task { await viewModel.getCoffeePicture() }
                }),
                secondaryButton: .cancel(Text("OK"))
            )
        }
    }
}
