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
    @State private var didTapNextPicture: Bool = false
    @State private var saveError: VGError?
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            if let coffeeImage = viewModel.coffee?.coffeeImage {
                Image(uiImage: coffeeImage)
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .cornerRadius(16)
                    .padding(16)
                    .onTapGesture (count: 2) {
                        Task {
                            if !isFavoritePicture && !viewModel.isLoading {
                                withAnimation {
                                    favoriteCurrentPicture()
                                }
                            }
                        }
                    }
                    .onTapGesture {
                        if !viewModel.isLoading {
                            withAnimation {
                                nextCoffeePicture()
                                didTapNextPicture = true
                            }
                        }
                    }
                    .opacity(viewModel.isLoading ? 0.4 : 1)
                    .animation(.snappy, value: viewModel.coffee?.coffeeImage)
                
                VStack {
                    HStack {
                        if !didTapNextPicture {
                            Text("Tap to see the next picture")
                                .font(.subheadline)
                                .padding()
                                .background(.blue)
                                .clipShape(.capsule)
                                .padding()
                        }
                        
                        Spacer()
                        
                        FavoritePictureButton(isFavoritePicture: $isFavoritePicture) {
                            if !isFavoritePicture {
                                favoriteCurrentPicture()
                            }
                        }
                    }
                    Spacer()
                }
            }
            
            if viewModel.displayEmptyState {
                EmptyCoffeeView() {
                    Task { await viewModel.getCoffeePicture() }
                }
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .onAppear {
            Task { @MainActor in
                if viewModel.coffee == nil {
                    await viewModel.getCoffeePicture()
                }
            }
        }
        .errorAlert(error: $viewModel.currentError) {
            Task { await viewModel.getCoffeePicture() }
        }
        .errorAlert(error: $saveError) {
            favoriteCurrentPicture()
        }
    }
    
    private func favoriteCurrentPicture() {
        guard let coffee = viewModel.coffee else {
            saveError = .noDataAvailable
            HapticManager.shared.error()
            return
        }
        
        context.insert(coffee)
        do {
            try context.save()
            isFavoritePicture = true
            HapticManager.shared.success()
        } catch {
            saveError = .saveFailed(error.localizedDescription)
            HapticManager.shared.error()
        }
    }
    
    private func nextCoffeePicture() {
        Task { @MainActor in
            isFavoritePicture = false
            await viewModel.getCoffeePicture()
        }
    }
}
